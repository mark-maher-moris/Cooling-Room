import 'package:flutter/material.dart';
import 'package:learn_1/colors.dart';

class NoNetScreen extends StatelessWidget {
  NoNetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'قد يكون الموبايل غير متصل بالانترنت',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
            CircularProgressIndicator(
              color: MyColors.myBlue,
              strokeWidth: 5.0,
            )
          ],
        ),
      ),
    );
  }
}
