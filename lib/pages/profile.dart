import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import 'package:tixtix/services/auth_service.dart';
import 'package:tixtix/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  final List<String> menuList = [
    'Bahasa',
    'Tentang Kami',
    'FAQ',
    'Syarat dan Ketentuan',
    'Kebijakan Privasi',
    'Hubungi Kami'
  ];
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/screen', (route) => false);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: kRedColor, content: Text(state.err)));
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-up', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoad) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 1.0,
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text('Akun Saya',
              style: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 140,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(26, 44, 80, 1)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Pieter Yu',
                                        style: TextStyle(
                                          color: kWhiteColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      const SizedBox(height: 8,),
                                      Text('+62 85158486659',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: kWhiteColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (){},
                                        color: kWhiteColor,
                                        constraints: const BoxConstraints(),
                                        iconSize: 28,
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(Icons.settings),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: const [
                                Expanded(
                                  child: ActivatePremiumTix(),
                                )
                            ],)
                          ],
                        ),
                      )
                    ],
                  ),
                  MenuItem(
                    onTap: (){
                    },
                    leading: const Text('Akun',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                  const SizedBox(height: 18,),
                  ...menuList.map((e) => 
                    MenuItem(
                      onTap: (){},
                      leading: Text(e,
                        style: const TextStyle(
                          fontSize: 16
                        ),
                      ),
                    )
                  ),
                  MenuItem(
                    onTap: (){},
                    leading: const Text('Versi App',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    ending: const Text('1.27.0',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                  MenuItem(
                    onTap: (){
                      context.read<AuthCubit>().signOut();
                    },
                    leading: Text('Keluar',
                      style: TextStyle(
                        color: kRedColor,
                        fontSize: 16
                      ),
                    ),
                    ending: const SizedBox()
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ActivatePremiumTix extends StatelessWidget{
  const ActivatePremiumTix({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 0)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text('TIXTIX',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Color.fromRGBO(245, 208, 128, 1)
                )
              ),
              Text('VIP',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Color.fromRGBO(26, 44, 80, 1),
                )
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                    color: Color.fromRGBO(26, 44, 80, 1),
                    width: 1.5
                  )
                )
              )
            ),
            child: const Text('AKTIFKAN',
              style: TextStyle(
                color: Color.fromRGBO(26, 44, 80, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Widget leading;
  Widget ending;
  final Function onTap;
  MenuItem({Key? key, required this.leading, required this.onTap, this.ending = const Icon(Icons.chevron_right)}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kWhiteColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  leading
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ending
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}