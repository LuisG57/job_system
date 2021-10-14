import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 40,
      width: 300,
      // height: defaultTargetPlatform == TargetPlatform.android
      //     ? height * 0.09
      //     : height * 0.04,
      // width: defaultTargetPlatform == TargetPlatform.android
      //     ? width * 0.2
      //     : width * 0.15,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          hintText: 'Search...',
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
