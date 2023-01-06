import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  // final List<Tab> _tabs = const <Tab>[
  //   Tab(
  //     child: Text(
  //       'TIKET AKTIF',
  //       style: TextStyle(fontWeight: FontWeight.w700),
  //     ),
  //   ),
  //   Tab(
  //     child: Text(
  //       'DAFTAR TRANSAKSI',
  //       style: TextStyle(fontWeight: FontWeight.w700),
  //     ),
  //   )
  //   // Tab(icon: Icon(Icons.directions_bike)),
  // ];

  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
    // _tabController.addListener(_handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    Widget ticket(List<TransactionModel> transcations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: transcations.map((TransactionModel transcations) {
              return Ticket(
                date: transcations.concert.date,
                id: transcations.concert.id!,
                location: transcations.concert.location,
                name: transcations.concert.name,
              );
            }).toList(),
          ),
        ),
      );
    }

    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: ((context, state) {
      if (state is TransactionLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is TransactionSuccess) {
        if (state.transactions.length == 0) {
          return Center(child: Text('Kamu belum memiliki transaksi'));
        } else {
          return Padding(
              padding: const EdgeInsets.all(16),
              child: TabBarView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // const TicketCategories(),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: ticket(state.transactions)),
                      )
                    ],
                  ),
                  const Icon(Icons.directions_transit),
                ],
              ));
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
      // return DefaultTabController(
      //     length: 2,
      //     child: Scaffold(
      //       appBar: AppBar(
      //         backgroundColor: Colors.white,
      //         iconTheme: const IconThemeData(color: Colors.black),
      //         leading: IconButton(
      //             onPressed: () {},
      //             padding: const EdgeInsets.symmetric(horizontal: 8),
      //             constraints: const BoxConstraints(),
      //             icon: const Icon(Icons.account_circle_outlined)),
      //         title: Text(
      //           'TIXTIX',
      //           style:
      //               TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
      //         ),
      //         centerTitle: true,
      //         actions: [
      //           IconButton(
      //               onPressed: () {},
      //               padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
      //               constraints: const BoxConstraints(),
      //               icon: const Icon(Icons.notifications))
      //         ],
      //         bottom: TabBar(
      //           labelColor: kBlackColor,
      //           unselectedLabelColor: kGreyColor,
      //           tabs: _tabs,
      //         ),
      //       ),
      //     ));

      // Center(
      //   child: Text('Halaman transaksi'),
      // );
    }));
  }
}

class TicketCategories extends StatefulWidget {
  const TicketCategories({Key? key}) : super(key: key);
  @override
  State<TicketCategories> createState() => _TicketCategories();
}

class _TicketCategories extends State<TicketCategories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ActiveTicketProvider())
          ],
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: activeTicketCategories.length,
            itemBuilder: (BuildContext context, int idx) {
              return CustomChip(
                label: activeTicketCategories[idx],
              );
            },
          ),
        ));
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  const CustomChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('build Custom Chip');
    ActiveTicketProvider provider = Provider.of<ActiveTicketProvider>(context);
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: ChoiceChip(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
        selected: provider.getSelectedCategory == label,
        backgroundColor: Colors.transparent,
        selectedColor: Colors.transparent,
        onSelected: (bool? val) {
          if (provider.getSelectedCategory != label)
            provider.setCategory = label;
        },
        // backgroundColor: Colors.transparent,
        label: Text(
          label,
          style: TextStyle(
              color: provider.getSelectedCategory == label
                  ? Colors.blue
                  : Colors.black),
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: provider.getSelectedCategory == label
                    ? Colors.blue
                    : kGreyColor),
            borderRadius: const BorderRadius.all(Radius.circular(6.0))),
      ),
    );
  }
}
