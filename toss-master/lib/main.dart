import 'package:flutter/material.dart';
import 'Games/coin_toss.dart';
import 'dart:math';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
class Home extends StatelessWidget {

  List<String> _strings = [
    "You FLIPPED a ",
    "You THREW a ",
    "You GOT a ",
    "You BUMPED on ",
    "The Results : ",
    "This coin got a ",
    "Were you expecting a ",
    "YES ",
  ];



  @override
  Widget build(BuildContext context) {
    return CoinToss(_strings);
  }
}
