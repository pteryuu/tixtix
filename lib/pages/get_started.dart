import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/image_get_started.png'))),
        // ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Watch your favorite idol',
                  style: primaryTextStyle.copyWith(
                      fontSize: 32, fontWeight: semiBold),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 50,
                child: Text(
                  'Explore new world with us and let\n yourself get an amazing experiences',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: light),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 80),
                width: 220,
                height: 55,
                child: TextButton(
                  child: Text(
                    'Get Started',
                    style: whiteTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(defaultRadius))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
