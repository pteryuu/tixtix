import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tixtix/shared/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              child: Text(
                'Masuk',
                style: whiteTextStyle,
              ),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => MyScreen(
                //     gender: '',
                //     email: sProv.getValueEmail,
                //     password: sProv.getValuePassword,
                //     name: sProv.getValueEmail,
                //     number: '',
                //   ),
                // ));
              },
            ),
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
