import 'dart:io';

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";

class UserImagePicker extends StatefulWidget {
  final Function(File pickedImage) imagePickFun;

  const UserImagePicker({Key key, this.imagePickFun}) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File pickedImage;
  void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      pickedImage = pickedImageFile;
    });

    widget.imagePickFun(pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CircleAvatar(
        radius: 40.0,
        backgroundColor: Colors.grey,
        backgroundImage: pickedImage != null
            ? FileImage(
                pickedImage,
              )
            : null,
      ),
      FlatButton.icon(
        onPressed: _pickImage,
        icon: Icon(Icons.image),
        label: Text("Add Image"),
      ),
    ]);
  }
}
