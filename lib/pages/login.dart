import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import '../../shared/theme.dart';

import 'package:tixtix/shared/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Email address'),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: emailController,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: 'Your email address',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: kPrimaryColor))),
          ),
        ]),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Password'),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: passController,
            obscureText: true,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: 'Your password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: kPrimaryColor))),
          ),
        ]),
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/screen', (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: kRedColor, content: Text(state.err)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoad) {
            return Center(
              child: CircularProgressIndicator(
                color: kWhiteColor,
              ),
            );
          }
          return Container(
            width: double.infinity,
            height: 55,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius))),
              onPressed: () {
                context.read<AuthCubit>().login(
                    email: emailController.text, password: passController.text);
              },
              child: Text(
                'Get Started',
                style:
                    whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Have an account?',
                  textAlign: TextAlign.left,
                  style:
                      blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                Text(
                  'TIXTIX',
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: bold, letterSpacing: 4),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            emailInput(),
            passwordInput(),
            submitButton(),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forgot password??',
                    style: blackTextStyle.copyWith(
                        fontSize: 15, fontWeight: light),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: Text('Register?',
                        style: blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: light)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
