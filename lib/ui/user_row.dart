import 'package:flutter/material.dart';
import 'package:user_list/core/model/user.dart';

class UserRow extends StatelessWidget {
  final User user;

  const UserRow({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(user.name);
  }
}
