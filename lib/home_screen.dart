import 'package:flutter/material.dart';
import 'package:learn_1/colors.dart';
import 'appbar.dart';
import 'room_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawerEnableOpenDragGesture: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                MyBar(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      RoomBox(
                        selected: false,
                      ),
                      RoomBox(
                        selected: true,
                      ),
                      RoomBox(
                        selected: false,
                      ),
                      RoomBox(
                        selected: false,
                      ),
                      RoomBox(
                        selected: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: MyColors.myRed,
                  thickness: 2,
                  endIndent: 30,
                  indent: 30,
                )
              ],
            ),
          )),
    );
  }
}
