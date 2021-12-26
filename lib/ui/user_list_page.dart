import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_list/core/user_paging_controller.dart';
import 'package:user_list/ui/user_group_view_model.dart';

import 'user_group.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final UserPagingController _pagingController = UserPagingController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _pagingController.fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        backgroundColor: Colors.white,
        title: const Text(
          'User List',
        ),
      ),
      body: PagedListView<int, UserGroupViewModel>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<UserGroupViewModel>(
          itemBuilder: (context, item, index) => UserGroup(userGroup: item),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
