import 'package:flutter/material.dart';
import 'constant.dart';
class ChildW extends StatelessWidget {
  dynamic? nicon;
  dynamic? nText;
  //constructor
  ChildW({required this.nicon,required this.nText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      nicon,
      Text(
        nText.toString(),
        style: KTextStyleLabel,
      ),
    ]);
  }
}

