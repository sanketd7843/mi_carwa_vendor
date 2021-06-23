import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/screens/DetailScreen/components/body.dart';

class DetailScreen extends StatelessWidget {
  final String shopName;
  final String shopId;
  final String shopAddress;
  final String shopContactNumber;
  final String shopOpeningTime;
  final String shopClosingTime;
  final String shopDescription;
  final String vendorId;

  const DetailScreen(
      {Key key,
      this.shopName,
      this.shopId,
      this.shopAddress,
      this.shopContactNumber,
      this.shopOpeningTime,
      this.shopClosingTime,
      this.shopDescription,
      this.vendorId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailScreenBody(
          shopAddress: shopAddress,
          shopClosingTime: shopClosingTime,
          shopContactNumber: shopContactNumber,
          shopDescription: shopDescription,
          shopId: shopId,
          shopName: shopName,
          shopOpeningTime: shopOpeningTime,
          vendorId: vendorId.toString()),
    );
  }
}
