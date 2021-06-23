import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:mi_carwa_vendor/components/rounded_button.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/constants/alertHelper.dart';
import 'package:mi_carwa_vendor/constants/apiUrls.dart';
import 'package:mi_carwa_vendor/models/userOrderModels/userMakeOrder.dart';
import 'package:mi_carwa_vendor/screens/HomeScreen/home_screen.dart';
import 'package:mi_carwa_vendor/screens/PaymentModeScreen/PaymentModeScreen.dart';
import 'package:mi_carwa_vendor/screens/SelectImagePan/SelectImagePan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(PaymentModeScreen());
}

class PaymentModeScreen extends StatefulWidget {
  final String shopName;
  final String shopId;
  final String shopAddress;
  final String shopContactNumber;
  final String shopOpeningTime;
  final String shopClosingTime;
  final String shopDescription;
  final String vendorId;
  final String dateTime;
  final String userId;

  const PaymentModeScreen(
      {Key key,
      this.shopName,
      this.shopId,
      this.shopAddress,
      this.shopContactNumber,
      this.shopOpeningTime,
      this.shopClosingTime,
      this.shopDescription,
      this.vendorId,
      this.dateTime,
      this.userId})
      : super(key: key);
  @override
  _PaymentModeScreen createState() => _PaymentModeScreen();
}

class _PaymentModeScreen extends State<PaymentModeScreen> {
  bool paymentdone = true;
  final picker = ImagePicker();
  bool isLoading = false;

  Future completePayment() async {
    isLoading = true;

    log("user_id ${widget.userId} + shop_id + ${widget.shopId} + ${widget.vendorId} + ${apiUrls.apiKey} + ${widget.dateTime}");
    try {
      FormData formData = FormData.fromMap({
        "user_id": widget.userId,
        "shop_id": widget.shopId,
        "vendor_id": widget.vendorId,
        "api_key": apiUrls.apiKey,
        "appointment_date": widget.dateTime,
      });
      isLoading = false;
      Response resp = await Dio().post(apiUrls.makeOrderUrl, data: formData);
      userMakeOrderModel u =
          userMakeOrderModel.fromJson(json.decode(resp.data));
      log(u.response + u.message);
      if (u.response == "200") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PaymentDoneScreen()));
      } else {
        var dialog = CustomAlertDialog(
            title: "Alert", message: u.message, negativeBtnText: 'No');
        showDialog(context: context, builder: (BuildContext context) => dialog);
      }
    } on DioError catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: new Text(
            'Select Payment Type',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
                SingleChildScrollView(
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
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, right: 18.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12.0,
                                                            left: 5.0),
                                                    child: Checkbox(
                                                      value: true,
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    "assets/images/visa.png",
                                                    width: 65,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0),
                                                    child: Text(
                                                      "Visa",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0,
                                              right: 18.0,
                                              top: 24.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12.0,
                                                            left: 5.0),
                                                    child: Checkbox(
                                                      value: false,
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    "assets/images/mastercard.png",
                                                    width: 65,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0),
                                                    child: Text(
                                                      "Mastercard",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0,
                                              right: 18.0,
                                              top: 24.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12.0,
                                                            left: 5.0),
                                                    child: Checkbox(
                                                      value: false,
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    "assets/images/paypal.png",
                                                    width: 65,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0),
                                                    child: Text(
                                                      "Paypal",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  child: RoundedButton(
                    text: "Proceed",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      completePayment();
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
