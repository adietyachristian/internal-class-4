// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class LocalFileStoragePage extends StatefulWidget {
  const LocalFileStoragePage({super.key});

  @override
  State<LocalFileStoragePage> createState() => _LocalFileStoragePageState();
}

class _LocalFileStoragePageState extends State<LocalFileStoragePage> {
  final String imageUrl =
      "https://uploads-ssl.webflow.com/5ee12d8e99cde2e20255c16c/5ef24bf356bbc9c5b56e4f5f_flutter-meme-its-all-widgets.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local File Storage'),
      ),
      body: Column(
        children: [
          Image.network(imageUrl),
          ElevatedButton(
            onPressed: () async {
              final response = await http.get(Uri.parse(imageUrl));

              final appDir = await getExternalStorageDirectory();
              final fileName = imageUrl.split('/').last;
              final file = File('${appDir!.path}/$fileName');

              await file.writeAsBytes(response.bodyBytes);

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Image Saved Successfully'),
                  content: Image.file(file),
                ),
              );
            },
            child: const Text('Download Image'),
          ),
        ],
      ),
    );
  }
}
