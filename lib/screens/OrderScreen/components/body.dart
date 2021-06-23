import 'package:mi_carwa_vendor/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/screens/OrderAcceptedScreen/components/acceptedScreenBody.dart';
import 'package:mi_carwa_vendor/screens/OrderCancelledScreen/components/cancelledScreenBody.dart';
import 'package:mi_carwa_vendor/screens/OrderPendingScreen/components/pendingScreenBody.dart';

class OrderScreenBody extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<OrderScreenBody> {
  // Current selected
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
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
              CancelledScreenBody(),
              PendingScreenBody(),
              AcceptedScreenBody(),
            ],
          ),
        ),
      ),
    );
  }
}
