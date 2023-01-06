import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else {
        print(user.email);
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/screen', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          'TIXTIX',
          style: whiteTextStyle.copyWith(
            fontSize: 32,
            fontWeight: medium,
            letterSpacing: 10,
          ),
        ),
      ),
    );
  }
}
