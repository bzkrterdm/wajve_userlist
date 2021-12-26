import 'package:flutter/material.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/ui/user_avatar.dart';
import 'package:user_list/ui/user_information.dart';

class UserRow extends StatelessWidget {
  final User user;

  const UserRow({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          UserAvatar(name: user.name, gender: user.gender),
          UserInformation(name: user.name, email: user.email)
        ],
      ),
    );
  }
}
