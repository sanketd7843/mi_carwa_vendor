import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/screens/ReferAndEarn/refer_and_earn.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/screens/WalletScreen/theme/light_color.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28.0),
      child: Container(
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .27,
              color: LightColor.black,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total Balance,',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: LightColor.lightNavyBlue),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '6,354',
                            style: GoogleFonts.mulish(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                                color: kPrimaryColor),
                          ),
                          Text(
                            ' ₹',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor.withAlpha(200)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
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
                            width: 85,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text("Refer",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )),
                      )
                    ],
                  ),
                  Positioned(
                    left: -170,
                    top: -170,
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: kPrimaryColor,
                    ),
                  ),
                  Positioned(
                    left: -160,
                    top: -190,
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: kPrimaryLightColor,
                    ),
                  ),
                  Positioned(
                    right: -170,
                    bottom: -170,
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: kPrimaryColor,
                    ),
                  ),
                  Positioned(
                    right: -160,
                    bottom: -190,
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: kPrimaryLightColor,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
