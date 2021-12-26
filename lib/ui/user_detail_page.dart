import 'package:flutter/material.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/ui/user_avatar.dart';
import 'package:user_list/ui/user_information.dart';

class UserDetailPage extends StatefulWidget {
  static const valueKey = ValueKey('UserDetailPage');
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
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        titleTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        backgroundColor: Colors.white,
        title: const Text(
          'User Details',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserAvatar(name: user.name, gender: user.gender, size: 72),
              const SizedBox(height: 18),
              UserInformation(name: user.name, email: user.email, alignment: CrossAxisAlignment.center),
            ],
          ),
        ),
      ),
    );
  }
}
