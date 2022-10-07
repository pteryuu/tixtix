import 'package:provider/provider.dart';
import 'package:tixtix/ui/pages/get_started_pages.dart';
import 'package:tixtix/ui/pages/login_page.dart';
import 'package:tixtix/ui/pages/home_page.dart';
import 'package:tixtix/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:tixtix/ui/pages/terms_and_condition_page.dart';
import 'ui/pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => SplashPage(),
      '/get-started': (context) => GetStartedPage(),
      '/sign-up': (context) => SignUpPage(),
      '/login': (context) => LoginPage(),
      '/main': (context) => HomePage(),
      '/terms': (context) => TCPage()
    });
  }
}
