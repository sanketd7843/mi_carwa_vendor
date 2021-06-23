import 'dart:convert';
import 'dart:developer';
import 'package:mi_carwa_vendor/components/rounded_button.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/constants/sharedHelpers.dart';
import 'package:mi_carwa_vendor/models/userLoginModels/UserLoginModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_carwa_vendor/screens/PaymentDoneScreen/PaymentDoneScreen.dart';

class SelectAddressScreenBody extends StatefulWidget {
  final String shopName;
  final String shopId;
  final String shopAddress;
  final String shopContactNumber;
  final String shopOpeningTime;
  final String shopClosingTime;
  final String shopDescription;
  final String vendorId;
  final String dateTime;

  const SelectAddressScreenBody(
      {Key key,
      this.shopName,
      this.shopId,
      this.shopAddress,
      this.shopContactNumber,
      this.shopOpeningTime,
      this.shopClosingTime,
      this.shopDescription,
      this.vendorId,
      this.dateTime})
      : super(key: key);

  @override
  _SelectAddressScreenBody createState() => _SelectAddressScreenBody();
}

class _SelectAddressScreenBody extends State<SelectAddressScreenBody> {
  String dd;
  String userId = "";
  sharedHelpers sharedHelper = sharedHelpers();

  void getUsersData() async {
    dd = await sharedHelper.getSharedPreferenceValue("userData");

    UserData udata = UserData.fromJson(json.decode(dd));
    setState(() {
      userId = udata.id.toString();
    });
    log("data user id" + userId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
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
      body: Container(
        height: h * 1,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Container(
                width: w * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Image.asset(
                              "assets/address.png",
                              height: size.height * 0.25,
                              width: w * 1,
                            ),
                            Text(
                              "Select Existing Address",
                              style: GoogleFonts.inter(
                                  fontSize: h * 0.030,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 30.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 5.0),
                              child: Checkbox(
                                value: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 20.0),
                              child: Icon(
                                Icons.pin_drop,
                                color: Colors.black54,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10.0),
                                  child: Text(
                                    "Office",
                                    style: GoogleFonts.inter(
                                        fontSize: h * 0.020,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue.shade600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 4.0),
                                  child: Text(
                                    "2, Sri Apartment, Nagpur, 440016",
                                    style: GoogleFonts.inter(
                                        fontSize: h * 0.020,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 5.0),
                              child: Checkbox(
                                value: false,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 20.0),
                              child: Icon(
                                Icons.pin_drop,
                                color: Colors.black54,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10.0),
                                  child: Text(
                                    "${widget.shopId}",
                                    style: GoogleFonts.inter(
                                        fontSize: h * 0.020,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue.shade600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 4.0),
                                  child: Text(
                                    "2, Sri Apartment, Nagpur, 440016",
                                    style: GoogleFonts.inter(
                                        fontSize: h * 0.020,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 5.0),
                              child: Checkbox(
                                value: false,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 20.0),
                              child: Icon(
                                Icons.pin_drop,
                                color: Colors.black54,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10.0),
                                  child: Text(
                                    "Office",
                                    style: GoogleFonts.inter(
                                        fontSize: h * 0.020,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue.shade600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 4.0),
                                  child: Text(
                                    "2, Sri Apartment, Nagpur, 440016",
                                    style: GoogleFonts.inter(
                                        fontSize: h * 0.020,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ), //bookMySlotButton

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28.0, 18.0, 28.0, 0.0),
                    // ignore: deprecated_member_use
                    child: RoundedButton(
                      text: "Done",
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PaymentModeScreen(
                                shopAddress: widget.shopAddress,
                                shopClosingTime: widget.shopAddress,
                                shopContactNumber: widget.shopAddress,
                                shopDescription: widget.shopDescription,
                                shopId: widget.shopId,
                                shopName: widget.shopName,
                                shopOpeningTime: widget.shopAddress,
                                vendorId: widget.vendorId,
                                dateTime: widget.dateTime,
                                userId: userId,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getUsersData();
  }
}
