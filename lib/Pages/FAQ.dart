import 'package:covidIEEE/Data/faqData.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
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
      body: ListView.builder(
        itemCount: FAQData.faqData.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ExpansionTile(
              title: Text(FAQData.faqData[index]['question'],
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(FAQData.faqData[index]['answer'],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                )
              ],
            ),
          );
      }),
    );
  }
}