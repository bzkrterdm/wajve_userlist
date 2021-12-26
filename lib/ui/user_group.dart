import 'package:flutter/material.dart';
import 'package:user_list/ui/user_group_view_model.dart';
import 'package:user_list/ui/user_row.dart';
import 'package:user_list/util/view_util.dart';

class UserGroup extends StatelessWidget {
  final UserGroupViewModel userGroup;

  const UserGroup({Key? key, required this.userGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userList = userGroup.userList;
    return Visibility(
      visible: userList.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userGroup.isActiveUsers ? 'Active' : 'Passive',
              style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                color: ViewUtil.userRowBackgroundColor(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return UserRow(user: userList[index]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
