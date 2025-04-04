// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

getImage(BuildContext context) async {
  bool? isCamera = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Choose",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          ListTile(
            title: Text("Camera"),
            leading: Icon(Icons.camera_alt),
            onTap: () {
              Navigator.of(context).pop(true);
            },
          ),
          ListTile(
            title: Text("Gallery"),
            leading: Icon(Icons.photo_sharp),
            onTap: () {
              Navigator.of(context).pop(false);
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
  if (isCamera == null) return;

  XFile? _file = await ImagePicker()
      .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
  return _file;
}

String uploadFileForUser(File file) {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = file.path.split("/").last;
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final uploadRef = storageRef.child("$userId/uploads/$timestamp-$fileName");
    String filePath = "$userId/uploads/$timestamp-$fileName";
    print(filePath);
    uploadRef.putFile(file);
    return filePath;
  } catch (e) {
    print(e);
  }
  return "none";
}

String uploadProof(File file, String username) {
  try {
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = file.path.split("/").last;
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final uploadRef = storageRef.child("proofs/$username/$timestamp-$fileName");
    String filePath = "proofs/$username/$timestamp-$fileName";
    print(filePath);
    uploadRef.putFile(file);
    return filePath;
  } catch (e) {
    print(e);
  }
  return "none";
}
