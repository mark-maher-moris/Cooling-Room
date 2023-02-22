import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';
import 'nonet_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController numControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80)),
                      color: MyColors.myBlue,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 15,
                            blurRadius: 20,
                            offset: Offset(0, -5))
                      ]),
                ),
                Text(
                  'تسجيل الدخول للغرفة',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            ' : رقم التيليفون',
            style: TextStyle(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
                controller: numControl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MyColors.myGreen,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.myGreen)),
                  border: OutlineInputBorder(),
                  label: Text('رقم التيليفون'),
                )),
          ),
          Text(
            ' الرقم السري',
            style: TextStyle(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
                controller: numControl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MyColors.myGreen,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.myGreen)),
                  border: OutlineInputBorder(),
                  label: Text('الرقم السري'),
                )),
          ),
          MaterialButton(
              color: MyColors.myBlue,
              child: Text(
                'دخول',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
              color: MyColors.myBlue,
              child: Text(
                'BY: Cooling System ',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoNetScreen()));
              })
        ]),
      ),
    );
  }
}
