import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/model/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_carwa_vendor/screens/CanceledScreen/canceled_screen.dart';
import 'package:mi_carwa_vendor/screens/ShopsScreen/pending_screen.dart';

class Body extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Body> {
  // Current selected
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kWhiteColor,
            title: Center(
                child: Text(
              'Orders',
              style: TextStyle(color: kPrimaryColor),
            )),
            bottom: TabBar(
              labelColor: kPrimaryColor,
              tabs: [
                Tab(text: "Cancelled"),
                Tab(text: "Pending"),
                Tab(text: "Accepted")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CanceledScreen(),
              CanceledScreen(),
              CanceledScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
