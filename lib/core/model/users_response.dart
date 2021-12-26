import 'user.dart';
import 'meta.dart';

class UsersResponse {
  UsersResponse({
    required this.meta,
    required this.userList,
  });

  late final Meta meta;
  late final List<User> userList;

  UsersResponse.fromJson(Map<String, dynamic> json) {
    meta = Meta.fromJson(json['meta']);
    userList = List.from(json['data']).map((e) => User.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meta'] = meta.toJson();
    _data['data'] = userList.map((e) => e.toJson()).toList();
    return _data;
  }
}