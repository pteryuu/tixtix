import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tixtix/cubit/concert_cubit.dart';
import 'package:tixtix/cubit/page_cubit.dart';
import 'package:tixtix/cubit/seat_cubit.dart';
import 'package:tixtix/cubit/transaction_cubit.dart';
import 'package:tixtix/pages/account.dart';
import 'package:tixtix/pages/get_started.dart';
import 'package:tixtix/pages/login.dart';
import 'package:tixtix/pages/screen.dart';
import 'package:tixtix/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:tixtix/pages/splash.dart';
import 'package:tixtix/pages/success.dart';
import 'package:tixtix/pages/terms_and_condition.dart';
import 'package:tixtix/providers/bottom_nav.dart';
import 'package:tixtix/providers/ticket_provider.dart';
import 'cubit/auth_cubit.dart';
import 'pages/home.dart';

void main() async {
  //Sebuah fungsi jika kita ada runApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<BottomNavProvider>(
        create: (context) => BottomNavProvider()),
    ChangeNotifierProvider<TicketProvider>(
        create: (context) => TicketProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ConcertCubit()),
        BlocProvider(create: (context) => SeatCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => PageCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/login': (context) => LoginPage(),
          '/screen': (context) => const ScreenPage(),
          '/terms': (context) => TCPage(),
          '/home': (context) => HomePage(),
          '/success': (context) => SuccessPage()
        },
        // home: ScreenPage(),
      ),
    );
  }
}
