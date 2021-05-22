import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/screens/HomeScreen/home_screen.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  // Current selected
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 32,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38.0),
            child: Container(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 26.0, 8.0, 12.0),
                        child: Text(
                          "Refer a friend",
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cocon-Regular-Font',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 12.0),
                        child: Text(
                          "Refer now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Cocon-Regular-Font',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/referimage2.png',
                    fit: BoxFit.fitWidth,
                    height: 275,
                    width: w * 1,
                  ),
                  SizedBox(height: h * 0.05),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),
                      ),
                    },
                    child: FlatButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Refer Now',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: h * 0.03,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: kPrimaryColor,
                      onPressed: () {
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 38.0, 8.0, 12.0),
                    child: Text(
                      "Or refer on",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cocon-Regular-Font',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/facebook.png',
                          height: 45,
                          width: 45,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/gmail.png',
                          height: 45,
                          width: 45,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/twitter.png',
                          height: 45,
                          width: 45,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/whatsapp.png',
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
