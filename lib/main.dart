import 'package:contact_app/screens/add_user.dart';
import 'package:contact_app/screens/home_screen.dart';
import 'package:contact_app/screens/users_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (contxt) => HomeScreen(),
        AddUser.routeName : (contxt) => AddUser(),
       //UserList.routeName : (contxt) => UserList(),

      }
      ,
    );
  }
}
