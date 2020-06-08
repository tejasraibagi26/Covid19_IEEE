import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryData extends StatefulWidget {

  @override
  _CountryDataState createState() => _CountryDataState();
}

class _CountryDataState extends State<CountryData> {

   List countryData;
  fetchCountryData() async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });  
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Country Data',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 25,
          fontWeight: FontWeight.w700
        ),
        ),
      ),
      body: countryData == null ? Center(child: CircularProgressIndicator(),) : ListView.builder(itemBuilder: (context,index){
        return Container(
          height: 130,
          margin: EdgeInsets.symmetric(vertical:10,horizontal:10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xff323232),
            boxShadow: [
              BoxShadow(
               color: Colors.grey[200],
                      blurRadius: 5.0,
                      offset: Offset(1.0, 4.0),
                      spreadRadius: 5
              )
            ]
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(countryData[index]['countryInfo']['flag'],
                    height: 100,width: 100,
                    ),
                    Text(countryData[index]['country'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Confirmed: ' + countryData[index]['cases'].toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                      ),
                      ),
                      Text('Active: ' + countryData[index]['active'].toString(),
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                      ),
                      ),
                      Text('Recovered: ' + countryData[index]['recovered'].toString(),
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                      ),
                      ),
                      Text('Deaths: ' + countryData[index]['deaths'].toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                      ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      itemCount: countryData == null ? 0 : countryData.length,),
    );
  }
}