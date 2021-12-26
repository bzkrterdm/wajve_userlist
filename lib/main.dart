import 'package:flutter/material.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/ui/user_detail_page.dart';
import 'package:user_list/ui/user_list_page.dart';

void main() {
  runApp(const UserListApp());
}

class UserListApp extends StatefulWidget {
  const UserListApp({Key? key}) : super(key: key);

  @override
  _UserListAppState createState() => _UserListAppState();
}

class _UserListAppState extends State<UserListApp> {
  User? _selectedUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: UserListPage(onUserSelected: (user) {
              setState(() {
                _selectedUser = user;
              });
            }),
          ),
          if (_selectedUser != null) MaterialPage(child: UserDetailPage(user: _selectedUser!, key: UserDetailPage.valueKey))
        ],
        onPopPage: (route, result) {
          final page = route.settings as MaterialPage;
          if (page.child.key == UserDetailPage.valueKey) {
            _selectedUser = null;
          }
          return route.didPop(result);
        },
      ),
    );
  }
}
