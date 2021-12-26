import 'package:user_list/core/model/user.dart';

class UserGroupViewModel {
  List<User> userList;
  bool isActiveUsers;

  UserGroupViewModel(this.userList, this.isActiveUsers);
}
