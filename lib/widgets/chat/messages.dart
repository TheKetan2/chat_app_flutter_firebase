// import 'dart:html';

import 'package:chat_app_flutter_firebase/widgets/chat/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder(
          stream: Firestore.instance
              .collection(
                'chats',
              )
              .orderBy(
                'createdAt',
                descending: true,
              )
              .snapshots(),
          builder: (ctx, chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final chatDocs = chatSnapshot.data.documents;
            return ListView.builder(
                reverse: true,
                itemCount: chatDocs.length,
                itemBuilder: (ctx, index) => MessageBubble(
                      key: ValueKey(chatDocs[index].documentID),
                      message: chatDocs[index]["text"],
                      isMe:
                          chatDocs[index]["userId"] == futureSnapshot.data.uid,
                    ));
          },
        );
      },
    );
  }
}

// class Messages extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Firestore.instance
//           .collection('chats/46nlhmiRIajSGjMKxpdo/messages')
//           .snapshots(),
//       builder: (ctx, snapShotData) {
//         if (snapShotData.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         var chatData = snapShotData.data.documents;
//         return ListView.builder(
//           itemCount: chatData.length,
//           itemBuilder: (index, data) {
//             return Text(chatData[index]["text"]);
//           },
//         );
//       },
//     );
//   }
// }
