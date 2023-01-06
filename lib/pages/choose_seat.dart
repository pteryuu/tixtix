import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tixtix/cubit/seat_cubit.dart';
import 'package:tixtix/models/concerts_model.dart';
import 'package:tixtix/models/transaction_model.dart';
import 'package:tixtix/pages/checkout.dart';
import 'package:tixtix/pages/widgets/custom_bottom.dart';
import 'package:tixtix/pages/widgets/seat_item.dart';
import 'package:tixtix/shared/theme.dart';

class ChooseSeatPage extends StatelessWidget {
  final ConcertModel concert;

  const ChooseSeatPage(this.concert, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Pilih Bangku\nFavoritmu',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // NOTE: AVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_available.png',
                  ),
                ),
              ),
            ),
            Text(
              'Tersedia',
              style: blackTextStyle,
            ),
            // NOTE: SELECTED
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_selected.png',
                  ),
                ),
              ),
            ),
            Text(
              'Terpilih',
              style: blackTextStyle,
            ),
            // NOTE: UNAVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_unavailable.png',
                  ),
                ),
              ),
            ),
            Text(
              'Tidak tersedia',
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // NOTE: SEAT INDICATORS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          child: Center(
                            child: Text(
                              'A',
                              style: grayTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          child: Center(
                            child: Text(
                              'B',
                              style: grayTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          child: Center(
                            child: Text(
                              'C',
                              style: grayTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          child: Center(
                            child: Text(
                              ' ',
                              style: grayTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          child: Center(
                            child: Text(
                              'D',
                              style: grayTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          child: Center(
                            child: Text(
                              'E',
                              style: grayTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          child: Center(
                            child: Text(
                              'F',
                              style: grayTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // NOTE: SEAT 1
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A1',
                            isAvailable: false,
                          ),
                          SeatItem(
                            id: 'B1',
                            isAvailable: false,
                          ),
                          SeatItem(
                            id: 'C1',
                            isAvailable: false,
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '1',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D1',
                          ),
                          SeatItem(
                            id: 'E1',
                          ),
                          SeatItem(
                            id: 'F1',
                          ),
                        ],
                      ),
                    ),

                    // NOTE: SEAT 2
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A2',
                          ),
                          SeatItem(
                            id: 'B2',
                          ),
                          SeatItem(
                            id: 'C2',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '2',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D2',
                          ),
                          SeatItem(
                            id: 'E2',
                          ),
                          SeatItem(
                            id: 'F2',
                          ),
                        ],
                      ),
                    ),
                    // NOTE: SEAT 3
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A3',
                          ),
                          SeatItem(
                            id: 'B3',
                          ),
                          SeatItem(
                            id: 'C3',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '3',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D3',
                          ),
                          SeatItem(
                            id: 'E3',
                          ),
                          SeatItem(
                            id: 'F3',
                          ),
                        ],
                      ),
                    ),
                    // NOTE: SEAT 4
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A4',
                          ),
                          SeatItem(
                            id: 'B4',
                          ),
                          SeatItem(
                            id: 'C4',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '4',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D4',
                          ),
                          SeatItem(
                            id: 'E4',
                          ),
                          SeatItem(
                            id: 'F4',
                          ),
                        ],
                      ),
                    ),
                    // NOTE: SEAT 5
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A5',
                          ),
                          SeatItem(
                            id: 'B5',
                          ),
                          SeatItem(
                            id: 'C5',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '5',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D5',
                          ),
                          SeatItem(
                            id: 'E5',
                          ),
                          SeatItem(
                            id: 'F5',
                          ),
                        ],
                      ),
                    ),

                    // NOTE: SEAT 6
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A6',
                          ),
                          SeatItem(
                            id: 'B6',
                          ),
                          SeatItem(
                            id: 'C6',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '6',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D6',
                          ),
                          SeatItem(
                            id: 'E6',
                          ),
                          SeatItem(
                            id: 'F6',
                          ),
                        ],
                      ),
                    ),

                    // NOTE: SEAT 7
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A7',
                          ),
                          SeatItem(
                            id: 'B7',
                          ),
                          SeatItem(
                            id: 'C7',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '7',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D7',
                          ),
                          SeatItem(
                            id: 'E7',
                          ),
                          SeatItem(
                            id: 'F7',
                          ),
                        ],
                      ),
                    ),

                    // NOTE: SEAT 8
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A8',
                          ),
                          SeatItem(
                            id: 'B8',
                          ),
                          SeatItem(
                            id: 'C8',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '8',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D8',
                          ),
                          SeatItem(
                            id: 'E8',
                          ),
                          SeatItem(
                            id: 'F8',
                          ),
                        ],
                      ),
                    ),

                    // NOTE: SEAT 9
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A9',
                          ),
                          SeatItem(
                            id: 'B9',
                          ),
                          SeatItem(
                            id: 'C9',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '9',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D9',
                          ),
                          SeatItem(
                            id: 'E9',
                          ),
                          SeatItem(
                            id: 'F9',
                          ),
                        ],
                      ),
                    ),

                    // NOTE: SEAT 10
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatItem(
                            id: 'A10',
                          ),
                          SeatItem(
                            id: 'B10',
                          ),
                          SeatItem(
                            id: 'C10',
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            child: Center(
                              child: Text(
                                '10',
                                style: grayTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SeatItem(
                            id: 'D10',
                          ),
                          SeatItem(
                            id: 'E10',
                          ),
                          SeatItem(
                            id: 'F10',
                          ),
                        ],
                      ),
                    ),

                    // NOTE: YOUR SEAT
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tempat duduk',
                            style: grayTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            state.join(', '),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // NOTE: TOTAL
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: grayTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(state.length * concert.price),
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            title: 'Lanjutkan pembayaran',
            onPressed: () {
              int price = concert.price * state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    TransactionModel(
                      concert: concert,
                      amountOfConcert: state.length,
                      selectedSeats: state.join(', '),
                      insurance: true,
                      refundable: false,
                      vat: 0.45,
                      price: price,
                      grandTotal: price + (price * 0.45).toInt(),
                    ),
                  ),
                ),
              );
            },
            margin: EdgeInsets.only(
              top: 30,
              bottom: 46,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(),
        ],
      ),
    );
  }
}
