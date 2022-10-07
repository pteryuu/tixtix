import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: defaultMargin, left: defaultMargin),
          height: 60,
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
          child: bottomNav(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(children: [
        Text(
          'Main Page',
        ),
        customBottomNavigation()
      ]),
    );
  }
}

class bottomNav extends StatelessWidget {
  const bottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_home.png'))),
            ),
            Container(
              width: 30,
              height: 2,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(18)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_booking.png'))),
            ),
            Container(
              width: 30,
              height: 2,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(18)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_card.png'))),
            ),
            Container(
              width: 30,
              height: 2,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(18)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_settings.png'))),
            ),
            Container(
              width: 30,
              height: 2,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(18)),
            )
          ],
        )
      ],
    );
  }
}
