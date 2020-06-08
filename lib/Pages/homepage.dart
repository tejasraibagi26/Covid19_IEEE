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
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'COVID - 19 TRACKER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                color: Colors.orange.shade50,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.warning,
                              color: Colors.orange.shade400,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('WARNING!',
                                style: TextStyle(
                                    color: Colors.orange.shade400,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Do Not Panic! Stay Home, Stay Safe!',
                          style: TextStyle(
                              color: Colors.orange.shade400,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              fontFamily: 'Poppins'),
                        ),
                      )
                    ]),
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
              Features()
            ],
          ),
        ),
      ),
    );
  }
}
