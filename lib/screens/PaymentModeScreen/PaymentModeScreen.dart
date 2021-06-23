import 'dart:io';

import 'package:mi_carwa_vendor/components/rounded_button.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/screens/HomeScreen/home_screen.dart';
import 'package:mi_carwa_vendor/screens/SelectImagePan/SelectImagePan.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(PaymentDoneScreen());
}

class PaymentDoneScreen extends StatefulWidget {
  @override
  _PaymentDoneScreen createState() => _PaymentDoneScreen();
}

class _PaymentDoneScreen extends State<PaymentDoneScreen> {
  bool paymentdone = true;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 170.0,
                    ),
                    Center(
                      child: Text(
                        "Success",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    paymentdone != false
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              width: 300,
                              height: h * 0.31,
                              child: Image.asset(
                                "assets/images/tickgreen.png",
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              width: 300,
                              height: h * 0.31,
                              child: Image.asset(
                                "assets/images/notsuccess.png",
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
                  // ignore: deprecated_member_use
                  child: paymentdone != true
                      ? new RoundedButton(
                          text: "Try Again",
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          },
                        )
                      : new RoundedButton(
                          text: "Done",
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
