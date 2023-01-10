import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:tixtix/cubit/transaction_cubit.dart';
import 'package:tixtix/models/transaction_model.dart';
import 'package:tixtix/pages/widgets/carousel.dart';
import 'package:tixtix/pages/widgets/ticket.dart';
import 'package:tixtix/providers/active_ticket_provider.dart';
import 'package:tixtix/shared/theme.dart';

import '../consts/data.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  late BannerAd _bannerAd;
  bool _isBannerReady = false;
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
    // _loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    Widget ticket(List<TransactionModel> transcations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            children: transcations.map((TransactionModel transcations) {
              return Ticket(
                date: transcations.concert.date,
                id: transcations.concert.id,
                location: transcations.concert.location,
                name: transcations.concert.name,
              );
            }).toList(),
          ),
        ),
      );
    }

    // Widget adv() {
    //   return Expanded(
    //       child: _isBannerReady
    //           ? Align(
    //               alignment: Alignment.bottomCenter,
    //               child: Container(
    //                 width: _bannerAd.size.width.toDouble(),
    //                 height: _bannerAd.size.height.toDouble(),
    //                 child: AdWidget(ad: _bannerAd),
    //               ),
    //             )
    //           : Container());
    // }

    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: ((context, state) {
      print(state);
      if (state is TransactionLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is TransactionSuccess) {
        if (state.transactions.length == 0) {
          return Center(child: Text('Kamu belum memiliki transaksi'));
        } else {
          return Column(
            children: [
              ticket(state.transactions),
              // adv(),
            ],
          );
        }
      }

      return Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 8),
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.account_circle_outlined)),
        title: Text(
          'TIXTIX',
          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
        ),
      ));
    }));
  }

  // void _loadBannerAd() {
  //   _bannerAd = BannerAd(
  //       size: AdSize.banner,
  //       adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //       listener: BannerAdListener(
  //         onAdLoaded: (_) {
  //           setState(() {
  //             _isBannerReady = true;
  //           });
  //         },
  //         onAdFailedToLoad: (ad, err) {
  //           _isBannerReady = false;
  //           ad.dispose();
  //         },
  //       ),
  //       request: AdRequest());
  //   _bannerAd.load();
  // }
}
