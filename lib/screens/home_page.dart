import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:covid19_flutter_app/components/counter.dart';
import 'package:covid19_flutter_app/components/my_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> data = {};
  Map<String, dynamic> countryData = {};
  String _selectedCountry = 'Nepal';
  List<dynamic> _countries = ['Nepal'];

  //api call
  Future getData() async {
    try {
      http.Response response = await http.get(
          Uri.encodeFull(
            'https://corona.lmao.ninja/v2/all',
          ),
          headers: {"Accept": "appilcation/json"});
      setState(() {
        data = json.decode(response.body);
      });
    } catch (e) {}
  }

  Future getCountries() async {
    try {
      http.Response response = await http.get(
          Uri.encodeFull(
            'https://corona.lmao.ninja/v2/countries',
          ),
          headers: {"Accept": "appilcation/json"});
      var countries = json.decode(response.body);
      // print(countries.map((country) => country["country".toString()]).toList());

      setState(() {
        _countries =
            countries.map((country) => country["country"].toString()).toList();
      });
    } catch (e) {}
  }

  Future getDataOfCountry(String country) async {
    try {
      http.Response response = await http.get(
          Uri.encodeFull(
            'https://corona.lmao.ninja/v2/countries/$country',
          ),
          headers: {"Accept": "appilcation/json"});
      setState(() {
        countryData = json.decode(response.body);
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    this.getCountries();
    this.getDataOfCountry(_selectedCountry);
  }

  @override
  Widget build(BuildContext context) {
    // print(countryData);
    // print(_countries);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              heading: "Stay Home, Stay Safe",
            ),
            // SizedBox(height: 5.0),
            data.length != 0
                ? MyCounterContainer(
                    title: "Global Stats",
                    date: DateFormat.yMMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(data["updated"])),
                    deathsNumber: data['deaths'].toString(),
                    infectedNumber: data['cases'].toString(),
                    recoveredNumber: data['recovered'].toString(),
                  )
                : Container(
                    height: 200.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            Container(
              height: 15.0,
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 1,
                    width: 180.0,
                    child: Center(
                      child: Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: 2.0,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.3,
                    child: Center(
                      child: Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: 2.0,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.2,
                    width: 180.0,
                    child: Center(
                      child: Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: 2.0,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.6)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20.0),
                    Image.asset("assets/images/location_icon.png"),
                    SizedBox(width: 20.0),
                    DropdownButton<dynamic>(
                      items: _countries
                          .map((dynamic country) => DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              ))
                          .toList(),
                      onChanged: (dynamic selectedCountry) {
                        setState(() {
                          _selectedCountry = selectedCountry;
                        });
                        this.getDataOfCountry(_selectedCountry);
                      },
                      value: _selectedCountry,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            countryData.length != 0
                ? MyCounterContainer(
                    title: "$_selectedCountry Stats",
                    date: DateFormat.yMMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            countryData["updated"])),
                    deathsNumber: countryData['deaths'].toString(),
                    infectedNumber: countryData['cases'].toString(),
                    recoveredNumber: countryData['recovered'].toString(),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }
}
