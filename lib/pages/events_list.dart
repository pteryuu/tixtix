import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tixtix/consts/data.dart';
import 'package:tixtix/pages/widgets/event_list_item.dart';
import 'package:tixtix/shared/theme.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}): super(key: key);

  @override 
  State<EventList> createState() => _EventList();
}

class _EventList extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 8),
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.account_circle_outlined)
          ),
          title: Text(
            'TIXTIX', 
            style: TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.notifications))
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int idx) {
              return EventListItem(
                first: idx == 0,
                thumbnail: eventList[idx]['img']!,
                title: eventList[idx]['title']!
              );
            },
            itemCount: eventList.length,
          ),
        ),
      ),
    );
  }
}