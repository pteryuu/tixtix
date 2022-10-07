import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/blocs/counter.dart';
import 'package:tixtix/ui/pages/ticket.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  final CubitCounter myCounter = CubitCounter();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> screens = [
      HomePage(),
      const TicketPage(),
    ];
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
        BlocBuilder(
            bloc: myCounter,
            builder: (context, state) {
              return screens[myCounter.increment()];
            }),
        customBottomNavigation()
      ]),
    );
  }
}

class bottomNav extends StatelessWidget {
  List<dynamic> dataNavigationBottomBarItem = const [
    {
      'icon': Icon(Icons.home_mini_outlined),
      'label': 'Home',
    },
    {
      'icon': Icon(Icons.airplane_ticket_outlined),
      'label': 'Ticket',
    },
    {
      'icon': Icon(Icons.person),
      'label': 'Profile',
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
  }
}
