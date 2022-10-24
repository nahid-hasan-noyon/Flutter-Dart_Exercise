import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';

  const ChatScreen({super.key});
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  String messageText = '';
  final messageTextController = TextEditingController();

  void getCurrentUser() async {
    try {
      User user = _auth.currentUser!;
      //// print(user);
      loggedInUser = user;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void messageStream() async {
    final snapshots = _firestore.collection('messages').snapshots();
    await for (var snapshot in snapshots) {
      for (var data in snapshot.docs) {
        print(data.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.of(context).pop();
                messageStream();
                //Implement logout functionality
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      try {
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                        });
                        messageTextController.clear();
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, asyncSnapshot) {
          List<MessageBubble> messageBubbles = [];
          if (!asyncSnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final queryDocumentSnapshots = asyncSnapshot.data!.docs;
          String? messageSender;
          String? messageText;

          for (var queryDocumentSnapshot in queryDocumentSnapshots) {
            Map information = queryDocumentSnapshot.data() as Map;
            information.forEach((key, value) {
              if (key == 'sender') {
                messageSender = value;
              } else {
                messageText = value;
              }
            });
            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: messageSender == loggedInUser.email,
            );
            messageBubbles.add(messageBubble);
          }

          return Expanded(
            child: ListView(
              reverse: true,
              children: messageBubbles,
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  String? sender;
  String? text;
  bool isMe;

  MessageBubble({
    super.key,
    required this.sender,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender as String,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            color: isMe ? Colors.lightBlueAccent : Colors.purple,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$text',
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
