import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import 'package:tixtix/shared/theme.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
          return const Center(
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
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'Tentang Kami',
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Apa itu TIXTIX?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                  SizedBox(height: 32),
                  UserTestimony(),
                  SizedBox(height: 28),
                  Text(
                    "TIXTIX adalah aplikasi layanan hiburan terdepan di Indonesia yang memberikan pengalaman baru dalam pembelian tiket film dan hiburan lainnya. Dengan TIXTIX, pengguna dapat mengetahui informasi tentang film terkini serta melakukan pemesanan tiket bioskop dengan mudah, cepat, dan aman.",
                  ),
                  SizedBox(height: 16),
                  Text(
                      "Aplikasi TIXTIX dapat diunduh di Play Store dan App Store"),
                  SizedBox(height: 32),
                  Row(
                    children: [
                      const Icon(Icons.facebook),
                      const SizedBox(width: 8),
                      Image.asset("assets/twitter.png", width: 20, height: 20),
                      const SizedBox(width: 8),
                      Image.asset("assets/linkedin.png", width: 20, height: 20),
                    ],
                  ),
                  Divider(color: Colors.grey, height: 40),
                  Center(
                    child: Column(
                      children: [
                        const Text("Apakah artikel ini membantu?"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                primary: kPrimaryColor,
                                side: BorderSide(
                                    color: kPrimaryColor, width: 1.6),
                                maximumSize: Size(90, 32),
                                minimumSize: Size(90, 32),
                              ),
                              child: Text(
                                "Ya",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                            const SizedBox(width: 20),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                primary: kPrimaryColor,
                                side: BorderSide(
                                    color: kPrimaryColor, width: 1.6),
                                maximumSize: Size(90, 32),
                                minimumSize: Size(90, 32),
                              ),
                              child: Text(
                                "Tidak",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text("4459 dari 6056 menganggap ini berguna",
                            style: TextStyle(fontSize: 11)),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Ada pertanyaan lagi?"),
                            SizedBox(width: 4),
                            Text("Kirim permintaan",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey, height: 40),
                  Text("Artikel terkait",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Text(
                      "Saya tidak menerima SMS kode OTP, apa yang harus saya lakukan",
                      style: TextStyle(color: Colors.blue[500], fontSize: 12)),
                  SizedBox(height: 16),
                  Text("Apa saja metode pembayaran yang dapat digunakan?",
                      style: TextStyle(color: Colors.blue[500], fontSize: 12)),
                  SizedBox(height: 16),
                  Text("Saya lupa PIN DANA saya, apa yang harus saya lakukan?",
                      style: TextStyle(color: Colors.blue[500], fontSize: 12)),
                  SizedBox(height: 16),
                  Text("Bagaimana cara membayar tiket?",
                      style: TextStyle(color: Colors.blue[500], fontSize: 12)),
                  SizedBox(height: 16),
                  Text("Hubungi Kami",
                      style: TextStyle(color: Colors.blue[500], fontSize: 12)),
                  Divider(color: Colors.grey, height: 40),
                  Text("Komentar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Text("0 komentar",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Divider(color: Colors.grey, height: 40),
                  Text("Artikel ditutup - tidak bisa memberikan komentar",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 60),
                  Divider(color: Colors.grey, height: 40),
                  SizedBox(height: 12),
                  Text("Pusat Bantuan TIXTIX",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class UserTestimony extends StatelessWidget {
  const UserTestimony({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  child: Icon(Icons.person, color: Colors.white),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)),
                ),
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 12,
                    ),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                )
              ],
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pieter"),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("1 hari yang lalu · Diperbarui",
                        style: TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 4),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            primary: kPrimaryColor,
            side: BorderSide(color: kPrimaryColor, width: 1.6),
            maximumSize: Size(70, 36),
            minimumSize: Size(70, 36),
          ),
          child: Text(
            "Ikuti",
            style: TextStyle(color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
