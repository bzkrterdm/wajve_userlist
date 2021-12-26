import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/core/user_provider.dart';
import 'package:user_list/ui/user_detail_page.dart';
import 'package:user_list/ui/user_list_page.dart';

void main() {
  runApp(UserListApp());
}

class UserListApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  UserListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => UserProvider(),
        builder: (context, _) {
          var userProvider = Provider.of<UserProvider>(context, listen: true);
          return Navigator(
            key: navigatorKey,
            pages: [
              const MaterialPage(child: UserListPage()),
              if (userProvider.selectedUser != null) MaterialPage(child: UserDetailPage(user: userProvider.selectedUser!))
            ],
            onPopPage: (route, result) {
              userProvider.deselectUser();
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }
}
