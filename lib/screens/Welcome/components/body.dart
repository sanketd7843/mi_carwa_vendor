import 'package:mi_carwa_vendor/Screens/SignupSignin/signupsignin_screen.dart';
import 'package:mi_carwa_vendor/Screens/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/Screens/Login/login_screen.dart';
import 'package:mi_carwa_vendor/Screens/Signup/signup_screen.dart';
import 'package:mi_carwa_vendor/Screens/Welcome/components/background.dart';
import 'package:mi_carwa_vendor/components/rounded_button.dart';
import 'package:mi_carwa_vendor/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Mi Carwa Vendor",
              style: TextStyle(
                fontSize: 23,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/login.png",
              height: size.height * 0.40,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpSignup();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
