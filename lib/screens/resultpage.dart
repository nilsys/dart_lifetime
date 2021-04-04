import 'package:flutter/material.dart';
import 'package:flutter_lifetime/Style/stylestrint.dart';
import 'package:flutter_lifetime/data/user_data.dart';
// ignore: unused_import
import 'package:flutter_lifetime/data/calculate.dart';

class ResultPage extends StatelessWidget {
  // ignore: unused_field
  final Data _data;
  ResultPage(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sonuç Sayfası",
          style: stringStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                Calculate(_data).calculate().toString(),
                style: stringStyle,
              ),
            ),
          ),
          Expanded(
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text(
                "Geri Dön",
                style: stringStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
