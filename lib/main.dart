import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:redirect_app/pages/home_page.dart';
import 'package:redirect_app/pages/login_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();

    Widget home = const LoginPage();

    if (box.read('login') == null) {
      box.write('login', false);
    } else {
      box.write('login', box.read('login'));
      if (box.read('login') == true && box.read('isRedirect') == false) {
        home = const HomePage();
      } else {
        home = const LoginPage();
      }
    }

    return MaterialApp(
      title: 'Redirect App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: home,
      debugShowCheckedModeBanner: false,
    );
  }
}
