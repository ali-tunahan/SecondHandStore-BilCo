import 'package:bil_co/ApiSingleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';
import '../Authorization.dart';
import '../Signalr_Service.dart';
import '../chatBox.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

/*
A list of users
A list of Strings //which will be the chatid
 */

late final List<String> _userNameList; //For the UI, loading the names who we talked with
late final List<String> _otherUserId; // For constructing the chat history
final MessageUserCollectiveType _MessageUserCollectiveType = MessageUserCollectiveType(mapOfLatestMessage: [], currUserId: ""); // For constructing the chat history

/*
Widget ProfileImage(MockMessage aMessage) {
  String imageUrl = aMessage.profileImageUrl ?? 'assets/default_profile.png';
  return CircleAvatar(
    radius: 35,
    backgroundImage: AssetImage(imageUrl),
  );
}

 */

/*
class LatestUserMessage{
  String userId;
  late String message;
  LatestUserMessage({required this.userId});
}

 */
class MessageUserCollectiveType{
  List<ChatDTO> mapOfLatestMessage;
  String currUserId;
  MessageUserCollectiveType({required this.mapOfLatestMessage, required this.currUserId});
}

Widget MessageRow(BuildContext context, ChatDTO aMessage) {
  return InkWell(
    onTap: () {
      final userId = aMessage.userId ?? "";
      context.go("/chat_box/$userId");
    },
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          if(aMessage.profileImageUrl != null)
            CircleAvatar(radius: 30, foregroundImage: NetworkImage(aMessage.profileImageUrl!))
          else
            CircleAvatar(radius: 30, foregroundImage: AssetImage("assets/a.png"))
          ,
          SizedBox(width: 8), // Add some spacing between the image and the text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aMessage.name ?? "",
                  style: TextStyle(
                    fontSize: 18, // Larger text size for sender's name
                    fontWeight: FontWeight.bold, // Bold text for sender's name
                  ),
                ),
                SizedBox(
                    height:
                        4),
                /*// Optional: Add some spacing between the name and message
                Text(
                  aMessage.message,
                  style: TextStyle(
                    fontSize: 14, // Smaller text size for message content
                    // Add other styles for message content if needed
                  ),
                ),
                 */
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class MessagesSection extends StatefulWidget {
  @override
  _MessagesSectionState createState() => _MessagesSectionState();
}
bool isLoading = false;
class _MessagesSectionState extends State<MessagesSection> {
  final userId = Authorization.userId ?? "";
  List<ChatDTO> messages = []; // List now holds MockMessage objects
  //late SignalRService _signalRService;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    setState(() {
      _loadChatPartners().then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }
  Future _loadChatPartners() async {
    var chats = (await AuthorizedAPISingleton.instance.getAuthApi().userchatsIdGet(id: userId)).data;
    if(chats != null){
      setState(() {
        _MessageUserCollectiveType.mapOfLatestMessage = [];
        _MessageUserCollectiveType.mapOfLatestMessage.addAll(chats);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MessagesListWidget(_MessageUserCollectiveType);
  }
}

class MessagesListWidget extends StatelessWidget {
  MessagesListWidget(_MessageUserCollectiveType);

  @override
  Widget build(BuildContext context) {
    List<Widget> messageRowsWithDividers = [];

    for (int i = 0; i < _MessageUserCollectiveType.mapOfLatestMessage.length; i++) {
      messageRowsWithDividers.add(MessageRow(context, _MessageUserCollectiveType.mapOfLatestMessage[i]));

      if (i < _MessageUserCollectiveType.mapOfLatestMessage.length - 1) {
        messageRowsWithDividers.add(
          Divider(height: 30, thickness: 1, color: Colors.grey[300]),
        );
      }
    }

    if(isLoading){
      return CircularProgressIndicator();
    }else{
      return Column(
        children: messageRowsWithDividers,
      );
    }
  }
}