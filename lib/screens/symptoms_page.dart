import 'package:covid19_flutter_app/components/my_header.dart';
import 'package:flutter/material.dart';

class SymptomsPage extends StatefulWidget {
  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(heading: "Symptoms of COVID-19"),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'What are the symptoms of COVID-19?',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Wrap(
              children: <Widget>[
                MySymptomContainer(
                  imagePath: "assets/icons/cough.png",
                  label: "Dry Cough",
                ),
                MySymptomContainer(
                  imagePath: "assets/icons/fever.png",
                  label: "High Fever",
                ),
                MySymptomContainer(
                  imagePath: "assets/icons/short_breath.png",
                  label: "Short Breath",
                ),
                MySymptomContainer(
                  imagePath: "assets/icons/muscle_pain.png",
                  label: "Muscles Pain",
                ),
                MySymptomContainer(
                  imagePath: "assets/icons/sore_throat.png",
                  label: "Sore throat",
                ),
                MySymptomContainer(
                  imagePath: "assets/icons/diarrhea.png",
                  label: "Diarrhea",
                ),
                MySymptomContainer(
                  imagePath: "assets/icons/headache.png",
                  label: "Headache",
                ),
                MySymptomContainer(
                  imagePath: "assets/icons/tiredness.png",
                  label: "Tiredness",
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 10.0,
              ),
              child: Text(
                'Note: In rare cases, COVID-19 can lead to severe respiratory problems, kidney failure or death.',
                style: TextStyle(
                    fontSize: 16.0, color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Center(
              child: Text(
                '© hopkinsmedicine.org',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}

class MySymptomContainer extends StatelessWidget {
  final String imagePath;
  final String label;
  MySymptomContainer({
    @required this.imagePath,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 8.0,
            color: Colors.grey.withOpacity(0.6),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
