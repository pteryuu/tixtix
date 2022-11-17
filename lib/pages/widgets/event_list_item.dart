import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tixtix/shared/theme.dart';

import '../event_detail.dart';

class EventListItem extends StatelessWidget {
  final dynamic eventItem;
  bool first;
  EventListItem(
      {Key? key,
      required this.eventItem,
      this.first = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
              EventDetail(data: eventItem)));
      },
      child: Column(
        children: [
          SizedBox(
            height: first ? 16 : 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Image.asset(eventItem['img'], fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              eventItem['desc'],
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Tags(label: 'New'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Text(
                          //   'something',
                          //   style: TextStyle(color: kGreyColor, fontSize: 11),
                          // ),
                          Text(
                            'read more',
                            style: TextStyle(color: kGreyColor, fontSize: 11),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider()
        ],
      ),
    );
  }
}

class Tags extends StatelessWidget {
  final String label;
  const Tags({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kGreyColor),
          borderRadius: BorderRadius.circular(2.0)),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(color: kGreyColor, fontSize: 10),
      ),
    );
  }
}
