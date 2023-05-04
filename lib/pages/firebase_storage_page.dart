// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStoragePage extends StatefulWidget {
  const FirebaseStoragePage({super.key});

  @override
  State<FirebaseStoragePage> createState() => _FirebaseStoragePageState();
}

class _FirebaseStoragePageState extends State<FirebaseStoragePage> {
  FirebaseStorage? _storage;
  File? _file;

  @override
  void initState() {
    super.initState();
    _storage = FirebaseStorage.instance;
  }

  Future<void> _pickImage() async {
    // Open the image picker and get the selected image
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadFile(BuildContext context) async {
    // Upload the selected file to Firebase Storage
    final storageRef = _storage!.ref().child('images/image.png');
    final uploadTask = storageRef.putFile(_file!);
    await uploadTask.whenComplete(() => showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Image Uploaded Successfully'),
          ),
        ));
  }

  Future<void> _getFile(BuildContext context) async {
    // Upload the selected file to Firebase Storage
    final storageRef = _storage!.ref().child('images/image.png');
    final downloadURL = await storageRef.getDownloadURL();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(downloadURL),
        content: Image.network(downloadURL),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_file != null) Image.file(_file!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _file != null
                  ? () {
                      _uploadFile(context);
                    }
                  : null,
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _file != null
                  ? () {
                      _getFile(context);
                    }
                  : null,
              child: const Text('Show Image'),
            ),
          ],
        ),
      ),
    );
  }
}
