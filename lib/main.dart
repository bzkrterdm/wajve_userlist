import 'package:flutter/material.dart';
import 'package:user_list/ui/user_list_page.dart';

void main() {
  runApp(const UserListApp());
}

class UserListApp extends StatelessWidget {
  const UserListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserListPage(),
    );
  }
}