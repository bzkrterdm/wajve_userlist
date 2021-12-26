import 'package:flutter/material.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/util/view_util.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final String gender;

  const UserAvatar({Key? key, required this.name, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _profilePicture(),
        _genderIcon(),
      ],
    );
  }

  Positioned _genderIcon() {
    return Positioned(
      bottom: 0,
      right: 0,
      width: 16,
      height: 16,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100), border: Border.all(width: 1, color: Colors.grey)),
        child: Icon(
          gender == User.genderMale ? Icons.male : Icons.female,
          color: Colors.black,
          size: 14,
        ),
      ),
    );
  }

  Positioned _profilePicture() {
    return Positioned(
      child: CircleAvatar(
        backgroundColor: ViewUtil.getColorForName(name),
        child: Text(
          _getCapitalLetters(name),
          style: const TextStyle(color: Colors.white),
        ),
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
