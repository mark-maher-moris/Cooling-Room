import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  bool isOn = false;
  MyRow(this.isOn, this.gText, this.badText);
  Color lampColor = Colors.red;
  String gText;
  String badText;

  @override
  Widget build(BuildContext context) {
    if (isOn == false) {
      lampColor = Colors.red;
    } else {
      lampColor = Colors.green;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: lampColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: lampColor, spreadRadius: 6, blurRadius: 6)
                ]),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          isOn == false ? badText : gText,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }
}
