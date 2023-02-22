import 'package:flutter/material.dart';
import 'colors.dart';

class RoomBox extends StatelessWidget {
  bool selected = false;
  RoomBox({required this.selected});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        height: 80,
        width: 86,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 5,
                  blurRadius: 12,
                  offset: Offset(0, 10))
            ],
            color: selected ? MyColors.myBlue : MyColors.myGreen,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Center(
          child: Text(
            'غرفة رقم 1',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
