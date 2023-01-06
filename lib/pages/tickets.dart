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
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
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
          return ticket(state.transactions);
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
}
