import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tixtix/shared/theme.dart';

class EventListItem extends StatelessWidget {
  final String title;
  final String thumbnail;
  bool first;
  EventListItem(
      {Key? key,
      required this.thumbnail,
      required this.title,
      this.first = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  child: Image.asset(thumbnail, fit: BoxFit.cover),
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
                            title,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Tags(label: 'News'),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'something',
                          style: TextStyle(color: kGreyColor, fontSize: 11),
                        ),
                        Text(
                          'here',
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
