import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/components/message.dart';

class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _textController = TextEditingController();
  CollectionReference query = FirebaseFirestore.instance.collection("messages");
  User loggedInUser;
  String messageText;

  void _getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Hero(
            tag: "chat_logo",
            child: Container(
              child: Image.asset('images/logo.png'),
              height: 20,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                }),
          ],
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Flash Chat"),

              // The view reflects the time of the last Firestore sync; which happens any time a field is updated.
              StreamBuilder(
                stream: FirebaseFirestore.instance.snapshotsInSync(),
                builder: (context, _) {
                  return Text(
                    'Last Check: ${DateTime.now()}',
                    style: Theme.of(context).textTheme.caption,
                  );
                },
              )
            ],
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: query.orderBy("time", descending: true).snapshots(),
                builder: (context, stream) {
                  if (stream.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (stream.hasError) {
                    return Center(child: Text(stream.error.toString()));
                  }
                  QuerySnapshot querySnapshot = stream.data;

                  return Expanded(
                    child: ListView.builder(
                      cacheExtent: 50,
                      reverse: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: querySnapshot.size,
                      itemBuilder: (context, index) => Message(
                          querySnapshot.docs[index], loggedInUser.email),
                    ),
                  );
                },
              ),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (messageText != "") {
                          _textController.clear();
                          query.add({
                            "sender": loggedInUser.email,
                            "messageText": messageText,
                            "time": FieldValue.serverTimestamp(),
                          });
                          setState(() {
                            messageText = "";
                          });
                        }
                      },
                      child: Text(
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
      ),
    );
  }
}
