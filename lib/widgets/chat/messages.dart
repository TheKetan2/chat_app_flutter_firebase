import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('chats/46nlhmiRIajSGjMKxpdo/messages')
          .snapshots(),
      builder: (ctx, snapShotData) {
        if (snapShotData.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        var chatData = snapShotData.data.documents;
        return ListView.builder(
          itemCount: chatData.length,
          itemBuilder: (index, data) {
            return Text(chatData[index]["text"]);
          },
        );
      },
    );
  }
}
