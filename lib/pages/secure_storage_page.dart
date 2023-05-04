import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStoragePage extends StatefulWidget {
  const SecureStoragePage({super.key});

  @override
  State<SecureStoragePage> createState() => _SecureStoragePageState();
}

class _SecureStoragePageState extends State<SecureStoragePage> {
  final _storage = const FlutterSecureStorage();
  final _key = 'token';
  final _token = 'TOKEN_TEST';
  String? _value;

  Future<void> _setValue() async {
    await _storage.write(key: _key, value: _token);
  }

  Future<void> _getValue() async {
    final value = await _storage.read(key: _key);
    setState(() {
      _value = value ?? "NO VALUE";
    });
  }

  Future<void> _deleteValue() async {
    await _storage.delete(key: _key);
    setState(() {
      _value = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _setValue,
              child: const Text('Set Value'),
            ),
            ElevatedButton(
              onPressed: _getValue,
              child: const Text('Get Value'),
            ),
            ElevatedButton(
              onPressed: _deleteValue,
              child: const Text('Delete Value'),
            ),
            _value != null ? Text(_value!) : Container(),
          ],
        ),
      ),
    );
  }
}
