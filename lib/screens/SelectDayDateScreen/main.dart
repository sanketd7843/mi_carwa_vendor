import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_carwa_vendor/constants.dart';

import 'package:mi_carwa_vendor/model/transaction_model.dart';
import 'package:mi_carwa_vendor/screens/DetailScreen/detail_screen.dart';
import 'package:mi_carwa_vendor/screens/SelectDayDateScreen/widget/date_time_picker_widget.dart';

void main() => runApp(SelectDayDate());

class SelectDayDate extends StatelessWidget {
  final String appTitle = 'Book Your Slot';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              // Max Size
              Padding(
                padding: EdgeInsets.only(top: 350.0),
                child: Container(
                  height: h * 1,
                  width: w * 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 250.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  30.0,
                                  20.0,
                                  30.0,
                                  20.0,
                                ),
                                child: Text(
                                  'Proceed',
                                  style: TextStyle(fontSize: 25.0),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(22), // <-- Radius
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 140.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            kpurpleColor,
                            kpurpleColor,
                          ],
                          begin: const FractionalOffset(0.0, 1.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.circular(80),
                      boxShadow: [
                        BoxShadow(
                          color: kTenBlackColor,
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: Offset(0.0, 8.0),
                        )
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Book Your Slot",
                            style: GoogleFonts.inter(
                                fontSize: h * 0.029,
                                fontWeight: FontWeight.w700,
                                color: kWhiteColor),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        20.0,
                                        10.0,
                                        20.0,
                                        10.0,
                                      ),
                                      child: Text(
                                        'Select Date Time',
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: kPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            22), // <-- Radius
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    // Yellow
                    height: 350.0,
                    width: w * 0.89,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: h * 0.33,
                  width: w * 0.7,
                  child: Padding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Calendar.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                // Yellow
                                height: 230.0,
                                width: w * 0.7,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(bottom: 16),
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
