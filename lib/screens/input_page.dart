import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lifetime/data/user_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_lifetime/Widgets/Container.dart';
import 'package:flutter_lifetime/Widgets/LowerColumn.dart';
import 'package:flutter_lifetime/Style/stylestrint.dart';
// ignore: unused_import
import 'resultpage.dart';
// ignore: duplicate_import
import 'package:flutter_lifetime/data/user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String onTapGender;
  double smokingCigarette = 0.0;
  double sporDay = 0.0;
  int peopleSize = 150;
  int kilo = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: topColumn("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: topColumn("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Günde Kaç Saat Spor Yapıyorsunuz?",
                    style: stringStyle,
                  ),
                  Text(
                    "${sporDay.round().toString()}",
                    style: intStyle,
                  ),
                  Slider(
                    min: 0,
                    max: 24,
                    divisions: 12,
                    value: sporDay,
                    onChanged: (double newValue) {
                      setState(() {
                        sporDay = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz?",
                    style: stringStyle,
                  ),
                  Text(
                    "${smokingCigarette.round().toString()}",
                    style: intStyle,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    divisions: 15,
                    value: smokingCigarette,
                    onChanged: (double newValue) {
                      setState(() {
                        smokingCigarette = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        onTapGender = 'KADIN';
                      });
                    },
                    myColor: onTapGender == 'KADIN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: LowerColumn("KADIN", FontAwesomeIcons.venus),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        onTapGender = 'ERKEK';
                      });
                    },
                    myColor: onTapGender == 'ERKEK'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: LowerColumn("ERKEK", FontAwesomeIcons.mars),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
              height: 50,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        Data(
                          onTapGender:onTapGender,
                          peopleSize:peopleSize,
                          kilo: kilo,
                          smokingCigarette: smokingCigarette,
                          sporDay: sporDay,
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  "HESAPLA",
                  style: stringStyle,
                ),
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Row topColumn(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          child: Text(
            label,
            style: stringStyle,
          ),
          quarterTurns: -1,
        ),
        SizedBox(
          width: 15,
        ),
        RotatedBox(
          child: Text(
            label == 'BOY' ? peopleSize.toString() : kilo.toString(),
            style: intStyle,
          ),
          quarterTurns: -1,
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              // ignore: deprecated_member_use
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.blue),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? peopleSize++ : kilo++;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              // ignore: deprecated_member_use
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.blue[600]),
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? peopleSize-- : kilo--;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
