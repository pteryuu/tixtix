import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tixtix/consts/data.dart';
import 'package:tixtix/cubit/concert_cubit.dart';
import 'package:tixtix/models/concerts_model.dart';
import 'package:tixtix/pages/profile.dart';
import 'package:tixtix/pages/widgets/search_bar.dart';
import 'package:tixtix/services/hide_keyboard.dart';
import 'package:tixtix/shared/theme.dart';
import 'package:flutter/services.dart';
import 'widgets/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = '${place.subAdministrativeArea}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  final ConcertModel concert = ConcertModel(id: '');
  @override
  void initState() {
    context.read<ConcertCubit>().fetchConcerts();
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: kPrimaryColor, title: SearchBar(), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            padding: const EdgeInsets.symmetric(horizontal: 8),
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.account_circle_outlined)),
        IconButton(
            onPressed: () {},
            padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.notifications)),
      ]),
      body: GestureDetector(
          onTap: () {
            hideKeyboard(context);
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
                child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Carousel(_currentAddress ?? "")),
              ],
            )),
          )
          //     SafeArea(
          //   child: SizedBox(
          //       width: double.infinity,
          //       height: MediaQuery.of(context).size.height,
          //       child: CustomScrollView(
          //         physics: const BouncingScrollPhysics(),
          //         slivers: [
          //           SliverAppBar(
          //             pinned: true,
          //             forceElevated: true,
          //             elevation: 1.0,
          //             backgroundColor: Colors.white,
          //             iconTheme: const IconThemeData(color: Colors.black),
          //             title: const SearchBar(),
          //             actions: [
          //               IconButton(
          //                   onPressed: () {
          //                     Navigator.of(context).push(MaterialPageRoute(
          //                         builder: (context) => ProfilePage()));
          //                   },
          //                   padding: const EdgeInsets.symmetric(horizontal: 8),
          //                   constraints: const BoxConstraints(),
          //                   icon: const Icon(Icons.account_circle_outlined)),
          //               IconButton(
          //                   onPressed: () {},
          //                   padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
          //                   constraints: const BoxConstraints(),
          //                   icon: const Icon(Icons.notifications))
          //             ],
          //           ),
          //           SliverToBoxAdapter(
          //             child: Container(
          //               padding: const EdgeInsets.all(16),
          //               height: MediaQuery.of(context).size.height / 6,
          //               child: const FilterWidget(),
          //             ),
          //           ),
          //           Carousel(),
          //           const SliverToBoxAdapter(
          //             child: Padding(
          //               padding:
          //                   EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //               child: Text('Events',
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 20,
          //                       fontWeight: FontWeight.bold)),
          //             ),
          //           ),
          //           SliverList(
          //             delegate: SliverChildBuilderDelegate(
          //                 (BuildContext context, int idx) {
          //               return Container();

          //               // EventListItem(
          //               //     first: idx == 0, eventItem: concert.id);
          //             }, childCount: concert.props.length),
          //           )
          //         ],
          //       )),
          // ),
          ),
    );
  }
}

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);
  @override
  State<FilterWidget> createState() => _FilterWidget();
}

class _FilterWidget extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          'This Month',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        Flexible(
          child: Categories(),
        )
      ],
    );
  }
}

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  final Map<String, dynamic> _categories = jsonDecode(jsonEncode(categories));

  void toggle(String category, bool value) {
    _categories[category] = value;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories.entries.map((e) {
                return MyButton(
                  text: e.key,
                  state: e.value,
                  onChangeState: (val) {
                    toggle(e.key, val);
                  },
                );
              }).toList(),
            ),
          ))
        ]);
  }
}

class MyButton extends StatefulWidget {
  final String text;
  final bool state;
  final Function(bool state)? onChangeState;
  const MyButton(
      {Key? key, required this.text, required this.state, this.onChangeState})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _state = false;
  @override
  void initState() {
    _state = widget.state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: FilterChip(
          shape: StadiumBorder(
              side: BorderSide(
                  color: _state
                      ? const Color(0xFF768AAB)
                      : const Color(0xFFE0E4F1))),
          label: Text(
            widget.text,
            style: TextStyle(
                fontSize: 14,
                color:
                    _state ? const Color(0xFF768AAB) : const Color(0xFF152E42),
                fontWeight: FontWeight.bold),
          ),
          selectedColor: Colors.transparent,
          selected: _state,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black,
          onSelected: (value) {
            setState(() {
              _state = value;
              widget.onChangeState!(value);
            });
          }),
    );
  }
}
