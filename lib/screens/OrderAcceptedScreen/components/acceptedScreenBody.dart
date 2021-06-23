import 'dart:convert';
import 'dart:developer';

import 'package:mi_carwa_vendor/constants/apiUrls.dart';
import 'package:mi_carwa_vendor/models/allOrdersModel/allOrdersModel.dart';
import 'package:mi_carwa_vendor/screens/ReferAndEarn/refer_and_earn.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptedScreenBody extends StatefulWidget {
  @override
  _AcceptedScreenBodyState createState() => _AcceptedScreenBodyState();
}

class _AcceptedScreenBodyState extends State<AcceptedScreenBody> {
  // Current selected
  int current = 0;
  List<AllOrdersData> dataFetched = [];
  bool isLoading = true;

  Future<allOrdersModel> getOrders() async {
    log("hello");
    try {
      FormData formData = FormData.fromMap(
          {"api_key": apiUrls.apiKey, "vendor_id": "1", "order_status": "2"});
      Response resp = await Dio().post(apiUrls.fetchAllOrders, data: formData);
      allOrdersModel u = allOrdersModel.fromJson(json.decode(resp.data));
      log("ffe" + u.response + u.message);
      isLoading = false;
      if (u.response == "200") {
        if (mounted)
          setState(() {
            dataFetched = u.data;
            isLoading = false;
          });
      } else {
        dataFetched = [];
        isLoading = false;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 8),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              isLoading == true
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 168.0),
                        child: Center(child: CircularProgressIndicator()),
                      ))
                  : Container(),
              // Custom AppBar
              // Card Section
              SizedBox(
                height: 15,
              ),

              ListView.builder(
                itemCount: dataFetched.length,
                padding: EdgeInsets.only(top: 10.0, right: 16, left: 16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ReferAndEarnScreen();
                          },
                        ),
                      ),
                    },
                    child: Container(
                      height: 106,
                      margin: EdgeInsets.only(bottom: 13),
                      padding: EdgeInsets.only(
                          left: 24, top: 12, bottom: 12, right: 22),
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
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 67,
                                width: 67,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/car.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    1.0, 1.0, 1.0, 4.0),
                                child: Text(
                                  dataFetched[index].firstname +
                                      dataFetched[index].lastname,
                                  style: GoogleFonts.inter(
                                      fontSize: h * 0.024,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                ),
                              ),
                              RatingBarIndicator(
                                rating: 2.75,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 17.0,
                                direction: Axis.horizontal,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    1.0, 1.0, 1.0, 4.0),
                                child: Text(
                                  "Accepted On - ${dataFetched[index].createdAt.substring(0, 10)}",
                                  style: GoogleFonts.inter(
                                      fontSize: h * 0.014,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    getOrders();
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  _AcceptedScreenBodyState context;

  OperationCard(
      {this.operation,
      this.selectedIcon,
      this.unselectedIcon,
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
