import 'dart:convert';
import 'dart:math';
import 'package:bil_co/ApiSingleton.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bil_co/Authorization.dart';
import 'package:bil_co/Signalr_Service.dart';
import 'package:bil_co/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:openapi/openapi.dart';

import 'constants.dart';

late String globalOtherUserId;

class ChatBox extends StatefulWidget {
  ChatBox({super.key, required otherUserId}){
    globalOtherUserId = otherUserId;
  }
  @override
  _ChatBox createState() => _ChatBox();
}

UserDTO chattedUser = UserDTO();
class _ChatBox extends State<ChatBox> {
  String? _currentAddress;
  Position? _currentPosition;
  bool isLoading = false;
  bool isUserLoading = false;
  List<types.Message> _messages = [];
  late SignalRService _signalRService;
  final userId = Authorization.userId ?? "";
  final _user = types.User(id: Authorization.userId ?? "");

  // Replace with the actual user ID
  @override
  void initState() {
    super.initState();
    _signalRService = SignalRService();
    setState(() {
      isLoading = true;
      isUserLoading = true;
    });
    AuthorizedAPISingleton.instance.getAuthApi().messagesReceiverUserIdSenderUserIdGet(receiverUserId: userId, senderUserId: globalOtherUserId).then((value) {
      final otherUser = types.User(id: globalOtherUserId);
      if(value.data != null){
        List<types.Message> finMessages = [];
        for(var message in value.data!){
          final textMessage = types.TextMessage(
            author: types.User(id: message.senderUserId ?? ""),
            createdAt: message.sentTime?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch,
            id: message.id ?? randomString(), // Replace with your ID generation logic
            text: message.text ?? "",
          );
          finMessages.add(textMessage);
        }
        finMessages.sort((a, b) => (b.createdAt ?? 0).compareTo(a.createdAt ?? 0));
        setState(() {
          _messages = finMessages;
        });
      }

    });
    _signalRService.initConnection(userId, Authorization.jwtToken ?? "").then((value) {
      _signalRService.startConnection().then((value){
        _signalRService.onReceiveMessage((message){
          {
            if (message.isNotEmpty && message[0] is Map) {
              Map messageMap = message[0];

              // Now extract the values
              var recId = messageMap['id'];
              var receiverUserId = messageMap['receiverUserId'];
              var senderUserId = messageMap['senderUserId'];
              var recTex = messageMap['text'];
              var time = messageMap['sentTime'];

              // If sentTime is a string, you might want to parse it into a DateTime
              DateTime sentDateTime = DateTime.parse(time) ?? DateTime.now();

              var messageActual = types.TextMessage(
                author: types.User(id: senderUserId),
                createdAt: sentDateTime.millisecondsSinceEpoch,
                id: recId, // Replace with your ID generation logic
                text: recTex,
              );
              setState(() {
                _messages.insert(0, messageActual);
              });

            }
          }
        });
        setState(() {
          isLoading = false;
        });
      });
    });

    AuthorizedAPISingleton.instance.getAuthApi().apiAuthIdGet(id: globalOtherUserId).then((value) {
      setState(() {
        chattedUser = value.data ?? UserDTO();
        isUserLoading = false;
      });
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(), // Replace with your ID generation logic
      text: message.text,
    );

    _signalRService.sendMessageToSpecificUser(userId,globalOtherUserId,
        message.text);
    setState(() {
       _messages.insert(0, textMessage);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  String calculateLocation() {
    _getCurrentPosition();
    return getGoogleUrl();
  }

  String getGoogleUrl() {
    if (_currentPosition == null) {
      return "Coordinates not available";
    }
    String google = "http://www.google.com/maps/place/";
    return "$google${_currentPosition!.latitude},${_currentPosition!.longitude}";
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true || isUserLoading == true) {
      // Display a loading indicator
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            if(chattedUser.userImage != null && chattedUser.userImage?.imageUrl! != null)
            CircleAvatar(
              foregroundImage: NetworkImage(chattedUser.userImage!.imageUrl!),
            )
            else
              const CircleAvatar(foregroundImage: AssetImage("assets/a.png"),)
            ,
            SizedBox(width: 10),
            Text("${chattedUser.firstName ?? ""} ${chattedUser.lastName ?? ""}"),
          ],
        ),
      ),
      body: Chat(
        onPreviewDataFetched: _handlePreviewDataFetched,
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.tealAccent[400],
          direction: SpeedDialDirection.down,
          icon: Icons.add,
          // The primary FAB icon
          activeIcon: Icons.close,
          // The icon when the FAB is opened
          visible: true,
          // Visibility of the Speed Dial
          closeManually: false,
          // If false, the dial will close on action tap
          curve: Curves.bounceIn,
          // The curve for the animation
          overlayColor: Colors.black,
          // The overlay color when the dial is open
          overlayOpacity: 0.5,
          // The overlay opacity
          children: [
            // Add children as SpeedDialChild widgets
            SpeedDialChild(
              child: Icon(Icons.location_city),
              backgroundColor: Colors.red,
              label: 'Send Location',
              onTap: () {
                String location = calculateLocation();
                if (location == 'Coordinates not available') {
                  location=calculateLocation();
                }
                else{
                  var locMessage = types.PartialText(
                    text: location
                  );
                  _handleSendPressed(locMessage);
                }
                // TODO: BURDA LOKASYON LINKI VAR
                print(calculateLocation());
              },
            )
          ],
        ));

  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }
}
