import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_carwa_vendor/components/default_button.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/main.dart';
import 'package:mi_carwa_vendor/screens/HomeScreen/home_screen.dart';
import 'package:mi_carwa_vendor/screens/ProfileScreen/profile_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: new Text(
          'Select Address',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: h * 0.4,
                  width: w * 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/address.png",
                                  height: size.height * 0.30,
                                  width: w * 1,
                                ),
                                Text(
                                  "Select Your Address",
                                  style: GoogleFonts.inter(
                                      fontSize: h * 0.030,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            'Address 1',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: kPrimaryColor,
                                fontFamily: 'Cocon-Regular-Font',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                          decoration: const InputDecoration(
                            hintText: "Plot no 1, HighDeal Society",
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            'Address 2',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: kPrimaryColor,
                                fontFamily: 'Cocon-Regular-Font',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                          decoration: const InputDecoration(
                            hintText: "CivilLines",
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            'City',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: kPrimaryColor,
                                fontFamily: 'Cocon-Regular-Font',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                          decoration: const InputDecoration(
                            hintText: "Nagpur",
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            'State',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: kPrimaryColor,
                                fontFamily: 'Cocon-Regular-Font',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                          decoration: const InputDecoration(
                            hintText: "Maharashtra",
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(height: 23),
              Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
                // ignore: deprecated_member_use
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: kPrimaryColor,
                  //onPressed: press,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Book My Slot',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
