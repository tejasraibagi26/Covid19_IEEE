import 'package:covidIEEE/Data/preventionData.dart';
import 'package:flutter/material.dart';

class Precautions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Precautions',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 25
        ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: PreventionData.preventionsData.length,
          itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            height: MediaQuery.of(context).size.height/6,
            width: MediaQuery.of(context).size.width,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(PreventionData.preventionsData[index]['image'],
                    height: 100,width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(PreventionData.preventionsData[index]['msg'],
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.w700
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ) ,
          );
        }
        ),
      ),
    );
  }
}