import 'dart:convert';
import 'dart:math';
import 'package:bil_co/ApiSingleton.dart';
import 'package:bil_co/chatBox.dart';
import 'package:bil_co/components/message_components.dart';
import 'package:http/http.dart' as http;

import 'package:signalr_core/signalr_core.dart';

import 'Authorization.dart';

class SignalRService {
  late HubConnection _hubConnection;
  late Function(dynamic message) onReceiveMessageCallback;

  // Initialize the connection
  Future<void> initConnection(String userId, String authToken) async {
    _hubConnection = HubConnectionBuilder()
        .withUrl(
      'wss://localhost:5084/chat?userId=$userId', // Replace with your SignalR hub URL
      HttpConnectionOptions(
        accessTokenFactory: () => Authorization.getJwtToken(),
        skipNegotiation: true,
        transport: HttpTransportType.webSockets,
      ),
    ).build();

    _hubConnection.onclose((error) => print('Connection Closed'));
  }

  // Start the connection
  Future<void> startConnection() async {
    if (_hubConnection.state != HubConnectionState.connected) {
      try {
        await _hubConnection.start();
        print('Connection Started');
      } catch (e) {
        print('Error starting connection: $e');
      }
    }
  }

  // Stop the connection
  Future<void> stopConnection() async {
    if (_hubConnection.state == HubConnectionState.connected) {
      await _hubConnection.stop();
      print('Connection Stopped');
    }
  }



  // Set callback for receiving messages
  void onReceiveMessage(Function(dynamic message) callback) {
    onReceiveMessageCallback = callback;
    _hubConnection.on('ReceiveMessageBySpecificUser', (message) => callback(message));
  }

  // Send message to specific user
  Future<void> sendMessageToSpecificUser(String userId, String receiverId, String message) async {
    if (_hubConnection.state == HubConnectionState.connected) {
      try {
        await _hubConnection.invoke('SendMessageToSpecificUser', args: [userId, receiverId, message]);
        print('Message sent');
      } catch (e) {
        print('Error sending message: $e');
      }
    } else {
      print('Connection not established');
    }
  }
}









String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}