import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/consts/data.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import 'package:tixtix/cubit/concert_cubit.dart';
import 'package:tixtix/models/concerts_model.dart';
import 'package:tixtix/pages/event_detail.dart';
import 'package:tixtix/pages/widgets/event_list_item.dart';
import 'package:tixtix/services/json_service.dart';
import 'package:tixtix/shared/theme.dart';

//TODO: Class ini ingin dibuat jadi list agar bisa ditaruh ke class Carousel utk melengkapi property yang ada.final data = [

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Carousel();
  }
}

class _Carousel extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularconcerts(List<ConcertModel> concerts) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: concerts.map((ConcertModel concert) {
              return ConcertCard(concert);
            }).toList(),
          ),
        ),
      );
    }

    Widget newconcerts(List<ConcertModel> concerts) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: concerts.map((ConcertModel concert) {
                return EventListItem(eventItem: concert);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<ConcertCubit, ConcertState>(
      listener: (context, state) {
        if (state is ConcertFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text('${state.err}'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ConcertSuccess) {
          print(state.concerts);
          return ListView(
            children: [
              header(),
              popularconcerts(state.concerts),
              newconcerts(state.concerts),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ConcertCard extends StatelessWidget {
  final ConcertModel concert;

  const ConcertCard(
    this.concert, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventDetail(data: concert)
                // DetailPage(destination),
                ),
          );
        },
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: kWhiteColor,
            child: GestureDetector(
              onTapUp: (details) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetail(data: concert)));
              },
              child: Column(
                children: [
                  Image(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage(concert.imageUrl
                          .replaceFirst("file:///", "https://")),
                      fit: BoxFit.fill),
                  Text(
                    concert.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            )));
  }
}

class ConcertTile extends StatelessWidget {
  final ConcertModel concert;

  const ConcertTile(
    this.concert, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetail(data: concert)
              // DetailPage(destination),
              ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    concert.imageUrl.replaceFirst("file:///", "https://"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    concert.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    concert.date,
                    style: grayTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
