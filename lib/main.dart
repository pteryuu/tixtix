import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixtix/pages/get_started.dart';
import 'package:tixtix/pages/login.dart';
import 'package:tixtix/pages/screen.dart';
import 'package:tixtix/pages/sign_up.dart';
import 'package:tixtix/pages/terms_and_condition.dart';
import 'package:tixtix/providers/bottom_nav.dart';
import 'package:tixtix/providers/ticket_provider.dart';

void main() async {
  //Sebuah fungsi jika kita ada runApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<BottomNavProvider>(
        create: (context) => BottomNavProvider()),
    ChangeNotifierProvider<TicketProvider>(
        create: (context) => TicketProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => const ScreenPage(),
        '/get-started': (context) => GetStartedPage(),
        '/sign-up': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/screen': (context) => const ScreenPage(),
        '/terms': (context) => TCPage()
      },
      // home: GetStartedPage(),
      home: const ScreenPage(),
    );
  }
}
