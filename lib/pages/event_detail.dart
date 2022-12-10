import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:intl/intl.dart';
import 'package:tixtix/models/concerts_model.dart';
import 'package:tixtix/services/json_service.dart';
import 'package:tixtix/shared/theme.dart';

class EventDetail extends StatelessWidget {
  final ConcertModel data;
  EventDetail({Key? key, required this.data}) : super(key: key);

  final oCcy = NumberFormat("#,##0", "in_ID");
  late String result;
  late JsonService helper;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 0))
              ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Image(
                    image: NetworkImageWithRetry(data.imageUrl.toString()),
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Start from IDR ${oCcy.format(data.price)}",
              style: blackTextStyle.copyWith(color: kGreyColor, fontSize: 12),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${data.name}",
              style: blackTextStyle.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal',
                        style: blackTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomBox(
                          label: '09 Nov, 2020', icon: Icons.calendar_month)
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Waktu', style: blackTextStyle),
                        const SizedBox(
                          height: 8,
                        ),
                        const CustomBox(label: '09:00 AM', icon: Icons.timer)
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.desc,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          height: 1.5,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Line Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(
                      height: 8,
                    ),
                    AvatarGroup(),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(top: 3, bottom: 3),
                        primary: kPrimaryColor),
                    child: Text(
                      'PESAN TIKET',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, letterSpacing: 1),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final IconData icon;
  final String label;
  const CustomBox({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 0))
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: blackTextStyle), Icon(icon)],
      ),
    );
  }
}

class AvatarGroup extends StatelessWidget {
  final List<String> imageList = [
    'assets/empty_user.png',
    'assets/empty_user.png',
    'assets/empty_user.png'
  ];
  AvatarGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        // width: MediaQuery.of(context).size.width - 16,
        child: Stack(
            children: List.generate(imageList.length, (index) {
          return Positioned(
              left: index * 30,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.0)),
                child: CircleAvatar(
                  backgroundImage: Image.asset(imageList[index]).image,
                  radius: 20,
                ),
              ));
        })));
  }
}
