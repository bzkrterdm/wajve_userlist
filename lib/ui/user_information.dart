import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  final String name;
  final String email;
  final CrossAxisAlignment alignment;

  const UserInformation({Key? key, required this.name, required this.email, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: alignment,
          children: [
            Text(name, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(email, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
