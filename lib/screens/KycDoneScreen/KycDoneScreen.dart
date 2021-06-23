import 'package:mi_carwa_vendor/components/rounded_button.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/screens/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(KycDoneScreen());
}

class KycDoneScreen extends StatefulWidget {
  @override
  _KycDoneScreen createState() => _KycDoneScreen();
}

class _KycDoneScreen extends State<KycDoneScreen> {
  bool kycdone = true;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 170.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your KYC Is Completed",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: h * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kycdone != false
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          width: 300,
                          height: h * 0.31,
                          child: Image.asset(
                            "assets/images/tickgreen.png",
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          width: 300,
                          height: h * 0.31,
                          child: Image.asset(
                            "assets/images/notsuccess.png",
                          ),
                        ),
                      ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
                  // ignore: deprecated_member_use
                  child: kycdone != true
                      ? new RoundedButton(
                          text: "Try Again",
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          },
                        )
                      : new RoundedButton(
                          text: "Done",
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
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
