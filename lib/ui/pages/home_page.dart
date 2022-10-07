import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/blocs/counter.dart';
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
  List<dynamic> dataNavigationBottomBarItem = const [
    {
      'icon': Icon(Icons.home_mini_outlined),
      'label': 'Latihan',
    },
    {
      'icon': Icon(Icons.airplane_ticket_outlined),
      'label': 'Laporan',
    },
    {
      'icon': Icon(Icons.person),
      'label': 'Profil',
    },
  ];

  bottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = CounterBloc();
    return StreamBuilder(
      stream: bloc.output,
      initialData: 0,
      builder: (context, snapshot) => BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 24,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(color: kPrimaryColor, size: 26),
        showUnselectedLabels: false,
        unselectedIconTheme:
            IconThemeData(color: Colors.black.withOpacity(0.25), size: 24),
        currentIndex: snapshot.data,
        onTap: (index) {
          bloc.output == index;
        },
        items: [
          for (var data in dataNavigationBottomBarItem)
            BottomNavigationBarItem(
              icon: (data['label'] == 'Latihan')
                  ? RotatedBox(quarterTurns: 1, child: data['icon'])
                  : data['icon'],
              label: data['label'],
            ),
        ],
      ),
    );

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         SizedBox(),
    //         Container(
    //           height: 24,
    //           width: 24,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage('assets/icon_home.png'))),
    //         ),
    //         Container(
    //           width: 30,
    //           height: 2,
    //           decoration: BoxDecoration(
    //               color: kPrimaryColor,
    //               borderRadius: BorderRadius.circular(18)),
    //         )
    //       ],
    //     ),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         SizedBox(),
    //         Container(
    //           height: 24,
    //           width: 24,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage('assets/icon_booking.png'))),
    //         ),
    //         Container(
    //           width: 30,
    //           height: 2,
    //           decoration: BoxDecoration(
    //               color: kPrimaryColor,
    //               borderRadius: BorderRadius.circular(18)),
    //         )
    //       ],
    //     ),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         SizedBox(),
    //         Container(
    //           height: 24,
    //           width: 24,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage('assets/icon_card.png'))),
    //         ),
    //         Container(
    //           width: 30,
    //           height: 2,
    //           decoration: BoxDecoration(
    //               color: kPrimaryColor,
    //               borderRadius: BorderRadius.circular(18)),
    //         )
    //       ],
    //     ),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         SizedBox(),
    //         Container(
    //           height: 24,
    //           width: 24,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage('assets/icon_settings.png'))),
    //         ),
    //         Container(
    //           width: 30,
    //           height: 2,
    //           decoration: BoxDecoration(
    //               color: kPrimaryColor,
    //               borderRadius: BorderRadius.circular(18)),
    //         )
    //       ],
    //     )
    //   ],
    // );
  }
}
