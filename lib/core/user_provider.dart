import 'package:flutter/cupertino.dart';
import 'package:user_list/core/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _selectedUser;

  User? get selectedUser => _selectedUser;

  void selectUser(User? user) {
    _selectedUser = user;
    notifyListeners();
  }

  void deselectUser() {
    selectUser(null);
  }
}
