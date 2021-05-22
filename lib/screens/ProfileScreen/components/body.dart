import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/screens/EditProfileScreen/edit_profile_screen.dart';
import 'package:mi_carwa_vendor/screens/ReferAndEarn/refer_and_earn.dart';
import 'package:mi_carwa_vendor/screens/WalletScreen/WalletScreen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Center(
            child: Text(
          'Profile',
          style: TextStyle(color: kPrimaryColor),
        )),
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
                icon: "assets/icons/key.png",
                press: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditProfileScreen();
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
                        return WalletScreen();
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
