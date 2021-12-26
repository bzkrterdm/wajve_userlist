import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_list/core/model/user.dart';
import 'package:user_list/core/service/users_service.dart';
import 'package:user_list/ui/user_row.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  int? _pageSize;

  final PagingController<int, User> _pagingController = PagingController(firstPageKey: 1);

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
      _pageSize ??= userResponse.meta.pagination.pages;
      final isLastPage = userResponse.meta.pagination.page == _pageSize!;
      var userList = userResponse.userList;
      if (isLastPage) {
        _pagingController.appendLastPage(userList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(userList, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PagedListView<int, User>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<User>(
            itemBuilder: (context, item, index) => UserRow(
              user: item,
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
