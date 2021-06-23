import 'package:mi_carwa_vendor/screens/SelectAddressScreen/components/body.dart';
import 'package:flutter/material.dart';

class SelectAddressScreen extends StatelessWidget {
  final String shopName;
  final String shopId;
  final String shopAddress;
  final String shopContactNumber;
  final String shopOpeningTime;
  final String shopClosingTime;
  final String shopDescription;
  final String vendorId;
  final String dateTime;

  const SelectAddressScreen(
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectAddressScreenBody(
        shopAddress: shopAddress,
        shopClosingTime: shopAddress,
        shopContactNumber: shopAddress,
        shopDescription: shopDescription,
        shopId: shopId,
        shopName: shopName,
        shopOpeningTime: shopAddress,
        vendorId: vendorId,
        dateTime: dateTime,
      ),
    );
  }
}
