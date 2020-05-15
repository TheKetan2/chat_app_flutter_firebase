import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;
  final String userId, userName;

  const MessageBubble({
    this.isMe,
    this.key,
    this.message,
    this.userId,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 140.0,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                12,
              ),
              topRight: Radius.circular(
                12,
              ),
              bottomLeft: !isMe
                  ? Radius.circular(0)
                  : Radius.circular(
                      12.0,
                    ),
              bottomRight: isMe
                  ? Radius.circular(0)
                  : Radius.circular(
                      12.0,
                    ),
            ),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              // FutureBuilder(
              //     future: Firestore.instance
              //         .collection("users")
              //         .document(userId)
              //         .get(),
              //     builder: (ctx, snapShot) {
              //       if (snapShot.connectionState == ConnectionState.waiting) {
              //         return Text("Loading...");
              //       }
              //       print(userName);
              //       return
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe ? Colors.black : Colors.white,
                ),
              ),
              // }),
              Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.black : Colors.white,
                ),
                textAlign: isMe ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
