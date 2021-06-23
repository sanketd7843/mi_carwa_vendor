import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/screens/EditProfileScreen/edit_profile_screen.dart';
import 'package:mi_carwa_vendor/screens/EditShopInformationScreen/edit_shop_information_screen.dart';
import 'package:mi_carwa_vendor/screens/KycDoneScreen/KycDoneScreen.dart';
import 'package:mi_carwa_vendor/screens/OrderAcceptDenyScreen/order_detail_screen.dart';
import 'package:mi_carwa_vendor/screens/ReferAndEarn/refer_and_earn.dart';
import 'package:mi_carwa_vendor/screens/SelectImageAadhar/SelectImageAadhar.dart';
import 'package:mi_carwa_vendor/screens/WalletScreen/WalletScreen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kWhiteColor,
        title: Text(
          'Profile',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              ProfilePic(),
              SizedBox(height: 10),
              Text(
                "Sammy",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              ProfileMenu(
                text: 'Shop Description',
                icon: "assets/icons/pin.png",
                press: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditShopInformationScreen();
                      },
                    ),
                  ),
                },
              ),
              ProfileMenu(
                text: 'KYC',
                icon: "assets/icons/key.png",
                press: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SelectAadahrCard();
                      },
                    ),
                  ),
                },
              ),
              ProfileMenu(
                text: "Wallet",
                icon: "assets/icons/wallet.png",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OrderAcceptDenyScreen();
                      },
                    ),
                  );
                },
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/logout.png",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
