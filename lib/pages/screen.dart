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

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:tixtix/blocs/counter.dart';
// import 'package:tixtix/home.dart';
// import 'package:tixtix/pages/ticket.dart';
// import 'package:tixtix/providers/bottom_nav.dart';
// import '../../shared/theme.dart';

// class ScreenPage extends StatelessWidget {
//   const ScreenPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final BottomNavProvider appProvider =
//         Provider.of<BottomNavProvider>(context);

//     List<dynamic> screens = [
//       const HomePage(),
//       const TicketPage(),
//     ];

//     Widget customBottomNavigation() {
//       return Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           width: double.infinity,
//           margin: EdgeInsets.only(bottom: defaultMargin, left: defaultMargin),
//           height: 60,
//           decoration: BoxDecoration(
//               color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
//           child: bottomNav(),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: Stack(children: [
//         screens[appProvider.indexScreen],
//         customBottomNavigation()
//       ]),
//     );
//   }
// }

// class bottomNav extends StatelessWidget {
//   List<dynamic> dataNavigationBottomBarItem = const [
//     {
//       'icon': Icon(Icons.home_mini_outlined),
//       'label': 'Latihan',
//     },
//     {
//       'icon': Icon(Icons.airplane_ticket_outlined),
//       'label': 'Laporan',
//     },
//     {
//       'icon': Icon(Icons.person),
//       'label': 'Profil',
//     },
//   ];

//   bottomNav({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     CounterBloc bloc = CounterBloc();
//     return StreamBuilder(
//       stream: bloc.output,
//       initialData: 0,
//       builder: (context, snapshot) => BottomNavigationBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconSize: 24,
//         showSelectedLabels: false,
//         selectedIconTheme: IconThemeData(color: kPrimaryColor, size: 26),
//         showUnselectedLabels: false,
//         unselectedIconTheme:
//             IconThemeData(color: Colors.black.withOpacity(0.25), size: 24),
//         currentIndex: snapshot.data,
//         onTap: (index) {
//           snapshot.data = index;
//         },
//         items: [
//           for (var data in dataNavigationBottomBarItem)
//             BottomNavigationBarItem(
//               icon: (data['label'] == 'Latihan')
//                   ? RotatedBox(quarterTurns: 1, child: data['icon'])
//                   : data['icon'],
//               label: data['label'],
//             ),
//         ],
//       ),
//     );
//   }
// }
