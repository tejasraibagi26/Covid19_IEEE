// import 'package:covidIEEE/Widgets/dos.dart';
import 'package:covidIEEE/Widgets/dos.dart';
import 'package:flutter/material.dart';

class DosDonts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'COVID - 19 TRACKER',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          child: Dos(),
        ));
  }
}
