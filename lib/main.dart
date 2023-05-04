import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internal_class_4/pages/firebase_storage_page.dart';
import 'package:internal_class_4/pages/local_file_storage_page.dart';
import 'package:internal_class_4/pages/secure_storage_page.dart';
import 'package:internal_class_4/pages/sqlite_page.dart';

import 'firebase_options.dart';
import 'pages/shared_preferences_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Internal Class 4',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        MenuButton(
          widget: SharedPreferencesPage(),
          text: 'Shared Preferences',
          color: Colors.red,
        ),
        MenuButton(
          widget: SecureStoragePage(),
          text: 'Secure Storage',
          color: Colors.green,
        ),
        MenuButton(
          widget: SqlitePage(),
          text: 'SQLite',
          color: Colors.blue,
        ),
        MenuButton(
          widget: FirebaseStoragePage(),
          text: 'Firebase',
          color: Colors.orange,
        ),
        MenuButton(
          widget: LocalFileStoragePage(),
          text: 'Local Storage',
          color: Colors.brown,
        ),
      ],
    ));
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.widget,
    required this.text,
    required this.color,
  });

  final Widget widget;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
        child: Container(
          color: color,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
