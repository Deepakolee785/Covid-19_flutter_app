import 'package:flutter/material.dart';

class MyCounterContainer extends StatefulWidget {
  final String title;
  final String date;
  final String infectedNumber;
  final String deathsNumber;
  final String recoveredNumber;

  MyCounterContainer({
    @required this.title,
    @required this.date,
    @required this.infectedNumber,
    @required this.deathsNumber,
    @required this.recoveredNumber,
  });
  @override
  _MyCounterContainerState createState() => _MyCounterContainerState();
}

class _MyCounterContainerState extends State<MyCounterContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Newest update on',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(widget.date),
                ],
              ),
              Text(
                'see more >>',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25.0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 8.0,
                  color: Colors.grey.withOpacity(0.6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CounterColumn(
                  image: "assets/images/infected_icon.png",
                  number: widget.infectedNumber,
                  label: "Infected",
                  color: Color(0xFF112689),
                ),
                CounterColumn(
                  image: "assets/images/death_icon.png",
                  number: widget.deathsNumber,
                  label: "Deaths",
                  color: Color(0xFFFB0000),
                ),
                CounterColumn(
                  image: "assets/images/recovered_icons.png",
                  number: widget.recoveredNumber,
                  label: "Recovered",
                  color: Color(0xFF14A43C),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CounterColumn extends StatelessWidget {
  final String image;
  final String number;
  final String label;
  final Color color;

  CounterColumn({
    @required this.image,
    @required this.number,
    @required this.label,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(image),
        SizedBox(height: 10.0),
        Text(
          number,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        SizedBox(height: 10.0),
        Text(label),
      ],
    );
  }
}
