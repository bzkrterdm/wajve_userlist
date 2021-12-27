import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_list/core/service/users_service.dart';
import 'package:user_list/ui/user_group_view_model.dart';

import 'model/user.dart';

class UserPagingController extends PagingController<int, UserGroupViewModel> {
  int? _pageSize;

  UserPagingController() : super(firstPageKey: 1);

  Future<void> fetchPage(int pageKey) async {
    try {
      final userResponse = await UsersService.getUsers(pageKey);
      _pageSize = userResponse.meta.pagination.pages;
      final isLastPage = userResponse.meta.pagination.page == _pageSize!;
      var userGroup = _groupUserByStatus(userResponse.userList);
      if (isLastPage) {
        appendLastPage(userGroup);
      } else {
        final nextPageKey = pageKey + 1;
        appendPage(userGroup, nextPageKey);
      }
    } catch (error) {
      this.error = error;
    }
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
