import 'package:flutter/material.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/util/view_util.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final String gender;
  final double size;

  const UserAvatar({Key? key, required this.name, required this.gender, required this.size}) : super(key: key);

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
      width: size / 3,
      height: size / 3,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100), border: Border.all(width: 1, color: Colors.grey)),
        child: Icon(
          gender == User.genderMale ? Icons.male : Icons.female,
          color: Colors.black,
          size: (size / 3) - (size / 25),
        ),
      ),
    );
  }

  Positioned _profilePicture() {
    return Positioned(
      child: Container(
        width: size,
        height: size,
        decoration:
            BoxDecoration(color: ViewUtil.getColorForName(name), borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Text(
            _getCapitalLetters(name),
            style: TextStyle(color: Colors.white, fontSize: (size) - (size / 3)),
          ),
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
