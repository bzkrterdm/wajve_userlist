import 'package:flutter/material.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/ui/user_avatar.dart';
import 'package:user_list/ui/user_information.dart';

class UserDetailPage extends StatefulWidget {
  final User user;
  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    var user = widget.user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        backgroundColor: Colors.white,
        title: const Text(
          'User Details',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            UserAvatar(name: user.name, gender: user.gender),
            UserInformation(name: user.name, email: user.email)
          ],
        ),
      ),
    );
  }
}
