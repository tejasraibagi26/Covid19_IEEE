import 'package:covidIEEE/Data/datasource.dart';
import 'package:flutter/material.dart';

class Dos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: ListView.builder(
                itemCount: DataSource.dos.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          DataSource.dos[index]['dos'],
                          style: TextStyle(
                              color:  Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: DataSource.dos[index]['fontsize'] == null ? 20: 40,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
