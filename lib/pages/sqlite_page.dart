import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlitePage extends StatefulWidget {
  const SqlitePage({super.key});

  @override
  State<SqlitePage> createState() => _SqlitePageState();
}

class _SqlitePageState extends State<SqlitePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  Future<Database> _openDatabase() async {
    // Open the database and create the table if it doesn't exist
    final path = await getDatabasesPath();
    final database = await openDatabase(
      join(path, 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  Future<void> _insertUser() async {
    // Insert a new user into the database
    final database = await _openDatabase();
    final name = _nameController.text;
    final email = _emailController.text;
    await database.insert(
      'users',
      {'name': name, 'email': email},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    setState(() {});
  }

  Future<List<Map<String, dynamic>>> _getUsers() async {
    // Get all users from the database
    final database = await _openDatabase();
    return await database.query('users');
  }

  Future<void> _deleteUser(int id) async {
    // Delete a user from the database
    final database = await _openDatabase();
    await database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQlite'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          ElevatedButton(
            onPressed: _insertUser,
            child: const Text('Add User'),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _getUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final users = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user['name']),
                      subtitle: Text(user['email']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteUser(user['id']);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
