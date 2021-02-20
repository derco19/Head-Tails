import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';

class CoinToss extends StatefulWidget {
  final List<String> _strings;

  CoinToss(this._strings);

  @override
  _CoinTossState createState() => _CoinTossState();
}

class _CoinTossState extends State<CoinToss> {

  String coin = "Heads";
  bool isFlipping = false;
  String text = "";
  String locationHeads = "assets/heads.png";
  String locationTails = "assets/tails.png";
  String locationFlip = "assets/flip.gif";
  String location = "assets/heads.png";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            'Coin Tosser',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('${location}'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$text',
                style: TextStyle(
                    color: Color.fromRGBO(247, 148, 30, 1),
                    fontFamily: 'KaushanScript',
                    fontSize: 28),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Visibility(
              visible: !isFlipping,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 2),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      text = "";
                      isFlipping = true;
                      int vari = Random().nextInt(2);

                      int i = Random().nextInt(widget._strings.length);
                      var before = widget._strings[i % widget._strings.length];
                      print(vari);
                      if (vari == 1) {
                        location = locationFlip;

                        Future.delayed(
                            Duration(seconds: 1 + Random().nextInt(4)), () {
                          setState(() {
                            location = locationTails;
                            text = before;
                            text += "TAILS";
                            isFlipping = false;
                          });
                        });
                      } else {
                        location = locationFlip;

                        Future.delayed(
                            Duration(seconds: 1 + Random().nextInt(4)), () {
                          setState(() {
                            location = locationHeads;
                            text = before;
                            text += "HEADS";
                            isFlipping = false;
                          });
                        });
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      //rgb(247, 148, 30)
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(247, 148, 30, 1),
                        Color.fromRGBO(246, 161, 47, 1)
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                          minWidth: 88.0,
                          minHeight: 36.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        '  FLIP  ',
                        style: TextStyle(fontFamily: 'KaushanScript'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
