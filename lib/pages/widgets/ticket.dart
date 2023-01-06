import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tixtix/models/transaction_model.dart';
import 'package:tixtix/shared/theme.dart';

/// 07:30 tetap
/// 3 oct 2022 (ganti sesuai tgl konser, contoh toba harmoni 15 oktober 2022)

class Ticket extends StatefulWidget {
  final String id;
  final String name;
  final String date;
  final String location;

  Ticket(
      {Key? key,
      required this.id,
      required this.name,
      required this.date,
      required this.location})
      : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      color: Colors.white,
      margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('TIXTIX',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Color.fromARGB(255, 243, 197, 98))),
                      Badge(
                        label: 'Selesai',
                      )
                    ],
                  ),
                  Text(
                    '${widget.name}',
                    style: blackTextStyle.copyWith(
                        fontWeight: black, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Row(
                    children: [
                      Icon(Icons.local_activity_sharp),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Kode Pemesanan: ${widget.id.toUpperCase().substring(0, 5)}',
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(widget.date,
                            // overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(CupertinoIcons.location),
                            Text(widget.location,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(startTime,
                  //         style: const TextStyle(
                  //             fontSize: 22,
                  //             color: Colors.black87,
                  //             fontWeight: FontWeight.w900)),
                  //     const Icon(Icons.chevron_right),
                  //     Text(endTime,
                  //         style: const TextStyle(
                  //             fontSize: 22,
                  //             color: Colors.black87,
                  //             fontWeight: FontWeight.w900)),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(widget.date,
                  //         // DateFormat('dd MMMM y')
                  //         //     .format(DateTime.parse(widget.date)),
                  //         style: const TextStyle(
                  //             fontSize: 14, fontWeight: FontWeight.w500))
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final String label;
  const Badge({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
