import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}): super(key: key);
  @override
  State<SearchBar> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      width: double.infinity,
      child: CupertinoTextField(
        keyboardType: TextInputType.text,
        placeholder: 'Search',
        textAlignVertical: TextAlignVertical.center,
        placeholderStyle: const TextStyle(
          color: Color.fromARGB(255, 152, 152, 154),
          fontSize: 16.0,
          fontFamily: 'Brutal',
        ),
        prefix: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: const Color(0xffF0F1F5),
        ),
      ),
    );
  }
}