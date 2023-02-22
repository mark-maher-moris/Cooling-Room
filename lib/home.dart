import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'colors.dart';
import 'home_screen.dart';
import 'myRow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final prefs = SharedPreferences.getInstance();
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  double temp = 0.0;
  var cDoor;
  var kbas;
  var faza;
  var heater;

  doorState() {
    DatabaseReference doorRef = FirebaseDatabase.instance.ref('test/cdoor');
    doorRef.onValue.listen((event) {
      var doorState = event.snapshot.value;
    });
  }

  @override
  void initState() {
    allData();
    super.initState();
  }

  allData() {
    ref.child('test/kabas').onValue.listen((event) {
      var data = event.snapshot.value;
      kbas = data;
    });
    ref.child('test/cdoor').onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        cDoor = data;
      });
    });
    ref.child('test/faza').onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        faza = data;
      });
    });
    ref.child('test/temp').onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        temp = double.parse(data.toString());
      });
    });
    ref.child('test/heater').onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        heater = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('غرفة ايمن قلاش'),
          centerTitle: true,
          backgroundColor: MyColors.myGreen),
      body: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        ' : درجة الحرارة الحالية',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        temp.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.black38,
                      ),
                      MyRow(kbas.toString() == 'false' ? false : true,
                          'الكباس شغال', 'الكباس مش شغال'),
                      Divider(
                        thickness: 2,
                        color: Colors.black38,
                      ),
                      MyRow(heater.toString() == 'false' ? false : true,
                          'السخانات شغالة', 'السخانات مش شغالة'),
                      Divider(
                        thickness: 2,
                        color: Colors.black38,
                      ),
                      MyRow(faza.toString() == 'false' ? false : true,
                          'الفازات شغالة', 'الفازات مش شغالة'),
                      Divider(
                        thickness: 2,
                        color: Colors.black38,
                      ),
                      MyRow(cDoor.toString() == 'false' ? false : true,
                          'باب الغرفة مقفول', 'باب الغرفة مفتوح'),
                      Divider(
                        thickness: 2,
                        color: Colors.black38,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                              color: Colors.blueAccent,
                              child: Text('اطفاء',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              onPressed: () async {
                                try {
                                  await ref
                                      .child('test')
                                      .update({'motor': false});
                                } catch (e) {
                                  print(e.toString());
                                }
                              }),
                          SizedBox(
                            width: 20,
                          ),
                          MaterialButton(
                              color: Colors.blueAccent,
                              child: Text('تشغيل',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              onPressed: () async {
                                try {
                                  await ref
                                      .child('test')
                                      .update({'motor': true});
                                } catch (e) {
                                  print(e.toString());
                                }
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      MaterialButton(
                          color: Colors.deepPurple,
                          child: Text(
                            'صمم هذا النظام م/ماهر موريس',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            launchWhatsAppString() async {
                              final link = WhatsAppUnilink(
                                phoneNumber: '+201201698895',
                                text: "رسالة من غرفة ايمن ",
                              );
//flutter.compileSdkVersion
                              await launchUrlString('$link');
                            }
                          }),
                      MaterialButton(
                          color: Colors.deepPurple,
                          child: Text(
                            'New UI',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
