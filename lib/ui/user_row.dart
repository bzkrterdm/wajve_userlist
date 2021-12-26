import 'package:flutter/material.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/util/view_util.dart';

class UserRow extends StatelessWidget {
  final User user;

  const UserRow({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ViewUtil.getColorForName(user.name),
            child: Text(
              _getCapitalLetters(user.name),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(user.email, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String _getCapitalLetters(String name) {
    String letters = '';
    for (var word in name.split(" ")) {
      if (word.contains(".")) {
        continue;
      }
      letters += word[0];
    }
    return letters.length > 2 ? letters.substring(0, 2) : letters;
  }
}
