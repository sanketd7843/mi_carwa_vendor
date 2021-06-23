import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/constants/apiUrls.dart';
import 'package:mi_carwa_vendor/constants/sharedHelpers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_carwa_vendor/models/userLoginModels/UserLoginModel.dart';
import 'package:mi_carwa_vendor/models/vendorShopsModels/vendorShopsModel.dart';
import 'package:mi_carwa_vendor/screens/DetailScreen/detail_screen.dart';
import 'package:mi_carwa_vendor/screens/EditProfileScreen/edit_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Body> {
  // Current selected
  int current = 0;
  SharedPreferences prefs;
  String username = "";
  String dd;
  sharedHelpers sharedHelper = sharedHelpers();
  List<VendorShopData> vendorDatafetched = [];
  bool isLoading = true;

  void getUsersData() async {
    dd = await sharedHelper.getSharedPreferenceValue("userData");

    UserData udata = UserData.fromJson(json.decode(dd));
    setState(() {
      username = udata.firstname;
    });
//    log("data mm" + username);
  }

  Future<vendorShopsModel> GetVendor() async {
    //  log("hello");
    try {
      FormData formData = FormData.fromMap({"api_key": apiUrls.apiKey});
      Response resp = await Dio().post(apiUrls.fetchVendorUrl, data: formData);
      vendorShopsModel u = vendorShopsModel.fromJson(json.decode(resp.data));
      //  log(u.response + u.message);
      isLoading = false;
      if (u.response == "200") {
        setState(() {
          vendorDatafetched = u.data;
        });
      } else {
        vendorDatafetched = [];
      }
    } on DioError catch (e) {
      //log(e.toString());
    }
  }

  @override
  void initState() {
    GetVendor();
    getUsersData();
  }

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
                padding: EdgeInsets.only(top: 250.0),
                child: Container(
                  height: h * 1,
                  width: w * 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0, left: 30.0),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isLoading == true
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 468.0),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      ))
                                  : Container(),
                              Text(
                                "Vendor List",
                                style: GoogleFonts.inter(
                                    fontSize: h * 0.024,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              (vendorDatafetched == null
                                  ? Text("No data found")
                                  : ListView.builder(
                                      itemCount: vendorDatafetched.length,
                                      padding:
                                          EdgeInsets.only(top: 10.0, right: 16),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return DetailScreen(
                                                          shopAddress:
                                                              vendorDatafetched[index]
                                                                      .shopAddress ??
                                                                  "",
                                                          shopClosingTime:
                                                              vendorDatafetched[index]
                                                                      .shopAddress ??
                                                                  "",
                                                          shopContactNumber:
                                                              vendorDatafetched[index]
                                                                      .shopAddress ??
                                                                  "",
                                                          shopDescription:
                                                              vendorDatafetched[index]
                                                                      .shopDescription ??
                                                                  "",
                                                          shopId: vendorDatafetched[index]
                                                                  .id
                                                                  .toString() ??
                                                              "",
                                                          shopName:
                                                              vendorDatafetched[index]
                                                                      .shopName ??
                                                                  "",
                                                          shopOpeningTime:
                                                              vendorDatafetched[
                                                                          index]
                                                                      .shopAddress ??
                                                                  "",
                                                          vendorId:
                                                              vendorDatafetched[
                                                                      index]
                                                                  .vendorId
                                                                  .toString()) ??
                                                      "";
                                                },
                                              ),
                                            ),
                                          },
                                          child: Container(
                                            height: 106,
                                            margin: EdgeInsets.only(bottom: 13),
                                            padding: EdgeInsets.only(
                                                left: 24,
                                                top: 12,
                                                bottom: 12,
                                                right: 22),
                                            decoration: BoxDecoration(
                                              gradient: new LinearGradient(
                                                  colors: [
                                                    kWhiteColor,
                                                    kWhiteColor,
                                                  ],
                                                  begin: const FractionalOffset(
                                                      0.0, 1.0),
                                                  end: const FractionalOffset(
                                                      1.0, 1.0),
                                                  stops: [0.0, 1.0],
                                                  tileMode: TileMode.clamp),
                                              color: kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: kTenBlackColor,
                                                  blurRadius: 10,
                                                  spreadRadius: 5,
                                                  offset: Offset(8.0, 8.0),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: 57,
                                                      width: 57,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/user_photo.png"),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          1.0, 1.0, 1.0, 4.0),
                                                      child: Text(
                                                        vendorDatafetched[index]
                                                                .shopName ??
                                                            "",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize:
                                                                    h * 0.019,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                    RatingBarIndicator(
                                                      rating: 2.75,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      itemCount: 5,
                                                      itemSize: 14.0,
                                                      direction:
                                                          Axis.horizontal,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          1.0, 1.0, 1.0, 4.0),
                                                      child: Text(
                                                        vendorDatafetched[index]
                                                                .shopContactNumber ??
                                                            "",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize:
                                                                    h * 0.014,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: Colors.black,
                                                      size: 23.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(left: 24, bottom: 16, top: 140.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                kWhiteColor,
                                kWhiteColor,
                              ],
                              begin: const FractionalOffset(0.0, 1.0),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: kTenBlackColor,
                              blurRadius: 15,
                              spreadRadius: 2,
                              offset: Offset(0.0, 8.0),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 13.0),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 42.0),
                                        child: Text(
                                          "Vehicle Type",
                                          style: GoogleFonts.inter(
                                              fontSize: h * 0.024,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 13.0, left: 5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.directions_car,
                                        color: Colors.black,
                                        size: 37.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            1.0, 1.0, 1.0, 4.0),
                                        child: Text(
                                          "Sedan",
                                          style: GoogleFonts.inter(
                                              fontSize: h * 0.02,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.directions_car,
                                        color: Colors.black,
                                        size: 37.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            1.0, 1.0, 1.0, 4.0),
                                        child: Text(
                                          "SUV",
                                          style: GoogleFonts.inter(
                                              fontSize: h * 0.02,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.directions_car,
                                        color: Colors.black,
                                        size: 37.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            1.0, 1.0, 1.0, 4.0),
                                        child: Text(
                                          "HatchBack",
                                          style: GoogleFonts.inter(
                                              fontSize: h * 0.02,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.more_horiz_outlined,
                                        color: Colors.black,
                                        size: 37.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            1.0, 1.0, 1.0, 4.0),
                                        child: Text(
                                          "More",
                                          style: GoogleFonts.inter(
                                              fontSize: h * 0.02,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Yellow
                        height: 170.0,
                        width: w * 0.89,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: h * 0.3,
                  width: w * 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 16, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: new LinearGradient(
                                        colors: [
                                          kMainPageGradientLight,
                                          kMainPageGradientDark,
                                        ],
                                        begin: const FractionalOffset(0.0, 1.0),
                                        end: const FractionalOffset(1.0, 1.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kTenBlackColor,
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        offset: Offset(0.0, 8.0),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0, left: 20.0),
                                            child: Container(
                                              height: 62,
                                              width: 62,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/user_photo.png"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, top: 12.0),
                                            child: Text(
                                              "Hello, Alex",
                                              style: GoogleFonts.inter(
                                                  fontSize: h * 0.030,
                                                  fontWeight: FontWeight.w800,
                                                  color: kWhiteColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10.0,
                                              left: 20.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          1.0, 7.0, 1.0, 1.0),
                                                  child: Text(
                                                    "Welcome To",
                                                    style: GoogleFonts.inter(
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: kWhiteColor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          1.0, 1.0, 1.0, 4.0),
                                                  child: Text(
                                                    "MI Carwa",
                                                    style: GoogleFonts.inter(
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: kWhiteColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0, right: 20.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.notifications_active,
                                                  color: kWhiteColor,
                                                  size: 35.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Yellow
                                  height: 170.0,
                                  width: w * 0.89,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final String contactNumber;
  final bool isSelected;
  _HomeScreenState context;

  OperationCard(
      {this.operation,
      this.selectedIcon,
      this.unselectedIcon,
      this.contactNumber,
      this.isSelected,
      this.context});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 123,
      height: 123,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kTenBlackColor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(8.0, 8.0),
            )
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected ? kBlueColor : kWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
              widget.isSelected ? widget.selectedIcon : widget.unselectedIcon),
          SizedBox(
            height: 9,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? kWhiteColor : kBlueColor),
          )
        ],
      ),
    );
  }
}
