import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Watch your favorite idol',
                  style: primaryTextStyle.copyWith(
                      fontSize: 32, fontWeight: semiBold),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 50,
                child: Text(
                  'Explore new world with us and let\n yourself get an amazing experiences',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: light),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    child: StreamBuilder<bool>(
                        initialData: true,
                        stream: _longOperation(),
                        builder: (context, snapshot) {
                          final isLoading = snapshot?.data ?? true;
                          return Stack(
                            children: <Widget>[
                              isLoading
                                  ? Visibility(
                                      visible: isLoading,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: kWhiteColor,
                                        ),
                                      ))
                                  : Text(
                                      'Get Started',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 18, fontWeight: medium),
                                    ),

                              // ),
                            ],
                          );
                        }),
                    onPressed: () {
                      Future.delayed(
                        Duration(
                          seconds: 3,
                        ),
                      );
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultRadius))),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

@override
Stream<bool> _longOperation() async* {
  yield true;
  //do some long operation instead of wait
  await Future.delayed(
    Duration(
      seconds: 3,
    ),
  );
  yield false;
}
