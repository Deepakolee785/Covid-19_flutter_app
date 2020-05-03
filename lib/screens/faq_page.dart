import 'package:covid19_flutter_app/components/my_header.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(heading: "About Covid-19"),
            FAQContainer(
              question: 'What is Coronavirus?',
              answer:
                  'Coronaviruses are a type of virus. There are many different kinds, and some cause disease. A newly identified type has caused a recent outbreak of respiratory illness now called COVID-19.',
            ),
            FAQContainer(
              question: 'How does the new coronavirus spread?',
              answer:
                  'As of now, researchers know that the new coronavirus is spread through droplets released into the air when an infected person coughs or sneezes. The droplets generally do not travel more than a few feet, and they fall to the ground (or onto surfaces) in a few seconds — this is why social and physical distancing is effective in preventing the spread.',
            ),
            FAQContainer(
              question: 'How does the new coronavirus spread?',
              answer:
                  'As of now, researchers know that the new coronavirus is spread through droplets released into the air when an infected person coughs or sneezes. The droplets generally do not travel more than a few feet, and they fall to the ground (or onto surfaces) in a few seconds — this is why social and physical distancing is effective in preventing the spread.',
            ),
            FAQContainer(
              question: 'What is the incubation period for COVID-19?',
              answer:
                  'It appears that symptoms are showing up in people within 14 days of exposure to the virus.',
            ),
            FAQContainer(
              question: 'How did this new coronavirus spread to humans?',
              answer:
                  'COVID-19 appeared in Wuhan, a city in China, in December 2019. Although health officials are still tracing the exact source of this new coronavirus, early hypotheses thought it may be linked to a seafood market in Wuhan, China. Some people who visited the market developed viral pneumonia caused by the new coronavirus. A study that came out on Jan. 25, 2020, notes that the individual with the first reported case became ill on Dec. 1, 2019, and had no link to the seafood market. Investigations are ongoing as to how this virus originated and spread. ',
            ),
            FAQContainer(
              question: 'Is this coronavirus different from SARS?',
              answer:
                  'SARS stands for severe acute respiratory syndrome. In 2003, an outbreak of SARS started in China and spread to other countries before ending in 2004. The virus that causes COVID-19 is similar to the one that caused the 2003 SARS outbreak: both are types of coronaviruses. Much is still unknown, but COVID-19 seems to spread faster than the 2003 SARS and also may cause less severe illness.',
            ),
            Text(
              '© hopkinsmedicine.org',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}

class FAQContainer extends StatelessWidget {
  final String question;
  final String answer;
  FAQContainer({@required this.question, @required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
