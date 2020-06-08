import 'package:flutter/material.dart';

class WorldData extends StatelessWidget {

  final Map worldData;

  const WorldData({Key key, this.worldData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          CovidStatus(
            title: "Confirmed",
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldData['cases'].toString(),
          ),
          CovidStatus(
             title: "Active",
            panelColor: Colors.blue[100],
            textColor: Colors.blue,
            count: worldData['active'].toString(),
          ),
          CovidStatus(
             title: "Recovered",
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldData['recovered'].toString(),
          ),
          CovidStatus(
             title: "Deaths",
            panelColor: Colors.grey[100],
            textColor: Colors.grey,
            count: worldData['deaths'].toString(),
          )
        ],
      ),
    );
  }
}


class CovidStatus extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const CovidStatus({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: panelColor,
        boxShadow: [BoxShadow(
          color: Colors.grey[200],
          blurRadius: 5.0,
          offset: Offset(1.0, 4.0),
          spreadRadius: 0
        )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
          ),
          SizedBox(height: 10,),
          Text(count,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
          )
        ],
      ),
    );
  }
}