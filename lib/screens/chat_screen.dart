import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore()
            .collection("/chats/peV29sZ0UFohaaIk56K1/messeges")
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: streamSnapshot.data.documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8.0),
              child: Text(streamSnapshot.data.documents[index].data["text"]),
            ),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
