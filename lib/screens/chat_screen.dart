import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(8.0),
          child: Text("This is awesome!"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Firestore()
                .collection("/chats/peV29sZ0UFohaaIk56K1/messeges")
                .snapshots()
                .listen((data) {
              print(data.documents[0]["text"]);
            });
          }),
    );
  }
}
