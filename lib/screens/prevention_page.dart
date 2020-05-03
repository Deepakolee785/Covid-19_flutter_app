import 'package:covid19_flutter_app/components/my_header.dart';
import 'package:flutter/material.dart';

class PreventionPage extends StatefulWidget {
  @override
  _PreventionPageState createState() => _PreventionPageState();
}

class _PreventionPageState extends State<PreventionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(heading: "Prevention of COVID-19"),
            QAContainer(
              question: 'How is COVID-19 diagnosed?',
              answer:
                  'Diagnosis may be difficult with only a physical exam because mild cases of COVID-19 may appear similar to the flu or a bad cold. A laboratory test can confirm the diagnosis',
            ),
            QAContainer(
              question: 'How is COVID-19 treated?',
              answer:
                  'As of now, there is not a specific treatment for the virus. People who become sick from COVID-19 should be treated with supportive measures: those that relieve symptoms. For severe cases, there may be additional options for treatment, including research drugs and therapeutics.',
            ),
            QAContainer(
              question: 'Does COVID-19 cause death?',
              answer:
                  'Yes, but there is high chance of recovery if you are healthy.',
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Preventive Measures',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Wrap(
              children: <Widget>[
                MyContainer(
                  imagePath: "assets/icons/stayhome.png",
                  label: 'Stay Home',
                ),
                MyContainer(
                  imagePath: "assets/icons/social_distancing.png",
                  label: 'Social\nDistancing',
                ),
                MyContainer(
                  imagePath: "assets/icons/wash_hands.png",
                  label: 'Wash Hands',
                ),
                MyContainer(
                  imagePath: "assets/icons/cough_cover.png",
                  label: 'Cover while\n coughing',
                ),
                MyContainer(
                  imagePath: "assets/icons/work_home.png",
                  label: 'Work from\nHome',
                ),
                MyContainer(
                  imagePath: "assets/icons/stayhome.png",
                  label: 'No mouth and nose touching',
                ),
                MyContainer(
                  imagePath: "assets/icons/usemask.png",
                  label: 'Use Mask',
                ),
                MyContainer(
                  imagePath: "assets/icons/sanitizer.png",
                  label: 'Use sanitizer',
                ),
                MyContainer(
                  imagePath: "assets/icons/no_handshake.png",
                  label: 'No handshake',
                ),
                MyContainer(
                  imagePath: "assets/icons/avoid_sneezing.png",
                  label: 'No Sneezing',
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
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
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }
}

class QAContainer extends StatelessWidget {
  final String question;
  final String answer;
  QAContainer({@required this.question, @required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            question,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            answer,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Divider(color: Colors.grey.withOpacity(0.6)),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final String imagePath;
  final String label;
  MyContainer({
    @required this.imagePath,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 170.0,
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
