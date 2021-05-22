import 'package:mi_carwa_vendor/constants.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/Screens/WalletScreen/theme/light_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_carwa_vendor/screens/ReferAndEarn/refer_and_earn.dart';

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
                            color: kWhiteColor),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '6,354',
                            style: GoogleFonts.inter(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                                color: kWhiteColor),
                          ),
                          Text(
                            ' ₹',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: kWhiteColor.withAlpha(200)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 85,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: GestureDetector(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text("Top up",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
