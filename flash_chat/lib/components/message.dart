import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message extends StatelessWidget {
  /// Contains all snapshot data for a given Message.
  final DocumentSnapshot snapshot;
  final String currentUser;

  /// Initialize a [Move] instance with a given [DocumentSnapshot].
  Message(this.snapshot, this.currentUser);

  /// Returns the [DocumentSnapshot] data as a a [Map].
  Map<String, dynamic> get message {
    return snapshot.data();
  }

  // Returns message details.
  Widget get details {
    return Column(
      crossAxisAlignment: currentUser == message['sender']
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        sender,
        Material(
          elevation: 5,
          borderRadius: BorderRadius.only(
            topLeft: currentUser == message['sender']
                ? Radius.circular(30)
                : Radius.zero,
            topRight: currentUser != message['sender']
                ? Radius.circular(30)
                : Radius.zero,
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: currentUser == message['sender']
              ? Colors.lightBlueAccent
              : Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: messageText,
          ),
        ),
      ],
    );
  }

  // Return the sender.
  Widget get sender {
    return Text(
      '${message['sender']}',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 12,
      ),
    );
  }

  // Return the messageText.
  Widget get messageText {
    return Text(
      '${message['messageText']}',
      style: TextStyle(
        color: currentUser == message['sender'] ? Colors.white : Colors.black54,
        fontSize: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: Row(
        mainAxisAlignment: currentUser == message['sender']
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [Flexible(child: details)],
      ),
    );
  }
}
