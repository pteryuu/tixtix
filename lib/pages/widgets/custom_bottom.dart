import 'package:flutter/material.dart';
import 'package:tixtix/shared/theme.dart';

class CustomButton extends StatelessWidget {
  String title;
  String pathName;
  CustomButton({super.key, required this.title, required this.pathName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 80),
      width: 220,
      height: 55,
      child: TextButton(
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius))),
        onPressed: () {
          Navigator.pushNamed(context, pathName);
        },
      ),
    );
  }
}
