import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({super.key});

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _loadThemeFromPrefs();
  }

  void _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isDark");
    setState(() {
      _isDark = isDark ?? false;
    });
  }

  void _saveNameToPrefs(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", isDark);
    setState(() {
      _isDark = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      backgroundColor: _isDark ? Colors.grey[900] : Colors.white,
      body: Center(
          child: Switch(
        value: _isDark,
        onChanged: (value) {
          _saveNameToPrefs(value);
        },
      )),
    );
  }
}
