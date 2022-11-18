// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../../shared/theme.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   Timer(Duration(seconds: 3), () {
//   //     User? user = FirebaseAuth.instance.currentUser;

//   //     if (user == null) {
//   //       Navigator.pushNamedAndRemoveUntil(
//   //           context, '/sign-up', (route) => false);
//   //     } else {
//   //       Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
//   //     }
//   //     ;
//   //   });

//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<bool>(
//       initialData: true,
//       stream: _longOperation(),
//       builder: (context, snapshot) {
//         final isLoading = snapshot.data ?? true;
//         return Stack(
//           children: <Widget>[
//             Container(
//               child: Center(
//                 child: Text('Base Widget : $isLoading'),
//               ),
//             ),
//             Visibility(
//               visible: isLoading,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   /// you can use any return type but should be able to distinguish when to start
//   /// and when to stop the progress bar
//   /// like, `null` for showing  and `not null` for hiding progress bar
  

//   //   Scaffold(
//   //     backgroundColor: kPrimaryColor,
//   //     body: Center(
//   //         child: Column(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: [
//   //         Container(
//   //           width: 100,
//   //           height: 100,
//   //           margin: EdgeInsets.only(bottom: 50),
//   //           decoration: BoxDecoration(
//   //               image: DecorationImage(
//   //                   image: AssetImage('assets/icon_plane.png'))),
//   //         ),
//   //         Text('AIRPLANE',
//   //             style: whiteTextStyle.copyWith(
//   //                 fontSize: 32, fontWeight: medium, letterSpacing: 10)),
//   //       ],
//   //     )),
//   //   );
//   // }
// }
