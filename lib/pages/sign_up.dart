import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController dateInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Are you ready to\nmeet your idol?',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Full Name'),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              cursorColor: kBlackColor,
              decoration: InputDecoration(
                  hintText: 'Your full name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(color: kPrimaryColor))),
            ),
          ]),
        );
      }

      Widget emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

      Widget birthInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Birth'),
            SizedBox(
              height: 6,
            ),
            TextFormField(
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Date of Birth',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                controller: dateInputController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                                primary: kPrimaryColor,
                                onPrimary: kWhiteColor,
                                onSurface: kPrimaryColor),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: kPrimaryColor,
                              ),
                            )),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('d MMMM y').format(pickedDate);
                    dateInputController.text = formattedDate;
                  }
                })
          ]),
        );
      }

      Widget submitButton() {
        return Container(
          width: double.infinity,
          height: 55,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius))),
            onPressed: () {
              Navigator.pushNamed(context, '/screen');
            },
            child: Text(
              'Get Started',
              style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
          ),
        );
      }

      Widget optionButton(String optionText, String pathName) {
        return TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/${pathName}');
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                '${optionText}',
                style: grayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                  // decoration: TextDecoration.underline
                ),
              ),
            ));
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            birthInput(),
            submitButton(),
            optionButton('Already have an account? Sign in', 'login'),
            SizedBox(
              height: 10,
            ),
            optionButton('Terms and condition', 'terms')
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [title(), inputSection()]),
      ),
    );
  }
}
