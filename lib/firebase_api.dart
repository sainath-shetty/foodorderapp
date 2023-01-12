import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
class FirebaseApi{
static UploadTask?uploadFile(String destination,File image) {
  try {
      final ref=FirebaseStorage.instance.ref(destination);
      return ref.putFile(image);
  }on FirebaseException catch (e) {
    return null;
  }
}
}