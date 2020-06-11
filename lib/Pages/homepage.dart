import 'dart:convert';
import 'package:covidIEEE/Widgets/features.dart';
import 'package:covidIEEE/Widgets/worldData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final urlWorldWide = "https://corona.lmao.ninja/v2/all";
  Map worldData;
  fetechWorldWideData() async {
    http.Response response = await http.get(urlWorldWide);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetechWorldWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
                  'COVID - 19 TRACKER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700),
                ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(children: <Widget>[
                    Text(
                      'WorldWide',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    worldData == null
                        ? CircularProgressIndicator()
                        : WorldData(
                            worldData: worldData,
                          ),
                  ])),
              SizedBox(
                height: 20,
              ),
              Features(),
              SizedBox(height: 50,),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text('Made by Tejas Raibagi',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 15
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
