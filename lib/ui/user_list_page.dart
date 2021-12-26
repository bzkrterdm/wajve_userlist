import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/core/service/users_service.dart';
import 'package:user_list/ui/user_group_view_model.dart';

import 'user_group.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  int? _pageSize;

  final PagingController<int, UserGroupViewModel> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final userResponse = await UsersService.getUsers(pageKey);
      _pageSize = userResponse.meta.pagination.pages;
      final isLastPage = userResponse.meta.pagination.page == _pageSize!;
      var userGroup = _groupUserByStatus(userResponse.userList);
      if (isLastPage) {
        _pagingController.appendLastPage(userGroup);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(userGroup, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
            itemBuilder: (context, item, index) => UserGroup(
              userGroup: item,
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  List<UserGroupViewModel> _groupUserByStatus(List<User> userList) {
    List<User> activeUsers = [];
    List<User> passiveUsers = [];
    for (var user in userList) {
      user.status == User.activeUserValue ? activeUsers.add(user) : passiveUsers.add(user);
    }
    List<UserGroupViewModel> userGroups = [UserGroupViewModel(activeUsers, true), UserGroupViewModel(passiveUsers, false)];
    return userGroups;
  }
}
