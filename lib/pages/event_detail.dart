import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tixtix/shared/theme.dart';

class EventDetail extends StatelessWidget {
  final Map<String, dynamic> data;
  EventDetail({Key? key, required this.data}) : super(key: key);

  final oCcy = NumberFormat("#,##0", "in_ID");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Image.asset(data['img'],
                        fit: BoxFit.fitWidth, width: 800.0),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Start from IDR ${oCcy.format(data['harga'])}",
                  style: TextStyle(color: kGreyColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "${data['title']}",
                  style: TextStyle(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text('Tanggal')],
                        ),
                        Text('test')
                      ],
                    ),
                    const Text('|'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text('Waktu')],
                        ),
                        Text('test')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
