import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixtix/pages/home.dart';
import 'package:tixtix/pages/profile.dart';
import 'package:tixtix/pages/ticket.dart';
import 'package:tixtix/providers/bottom_nav.dart';
import 'package:tixtix/shared/theme.dart';

class ScreenPage extends StatelessWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavProvider appProvider =
        Provider.of<BottomNavProvider>(context);

    List<dynamic> screens = [
      const HomePage(),
      const TicketPage(),
      const ProfilePage()
    ];

    // Timer.periodic(const Duration(seconds: 3), (timer) {
    //   (appProvider.indexScreen < 1)
    //       ? appProvider.indexScreen += 1
    //       : timer.cancel();
    // });

    return Scaffold(
      // appBar: (appProvider.indexScreen == 0 || appProvider.indexScreen == 1)
      //     ? null
      //     : appBar(titleScreens[appProvider.halaman]),
      body: screens[appProvider.indexScreen],
      bottomNavigationBar: bottomBar(appProvider),
    );
  }
}

BottomNavigationBar bottomBar(BottomNavProvider appProvider) {
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
      'icon': Icon(Icons.person_outline),
      'label': 'Profil',
    },
  ];

  return BottomNavigationBar(
    backgroundColor: Colors.white,
    elevation: 0,
    iconSize: 24,
    showSelectedLabels: false,
    selectedIconTheme: IconThemeData(color: kPrimaryColor, size: 26),
    showUnselectedLabels: false,
    unselectedIconTheme:
        IconThemeData(color: Colors.black.withOpacity(0.25), size: 24),
    currentIndex: appProvider.halaman,
    onTap: (index) {
      appProvider.halaman = index;
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
  );
}
