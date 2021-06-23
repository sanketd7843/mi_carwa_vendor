import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/components/default_button.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/main.dart';
import 'package:mi_carwa_vendor/screens/HomeScreen/home_screen.dart';
import 'package:mi_carwa_vendor/screens/ProfileScreen/profile_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              backgroundColor: kPrimaryColor,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: kWhiteColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  transform: Matrix4.translationValues(0, 55, 0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: kPrimaryMatch,
                    child: CircleAvatar(
                      radius: 47,
                      backgroundColor: kPrimaryMatch,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(height: 70),
                Text(
                  "James Bond",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                Container(height: 3),
                Text('New York',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 16,
                    )),
                Container(height: 25),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "James Bond",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Email Id',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "JamesBond@gmail.com",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "********",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "0987654321",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Shop Description',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "Description",
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(height: 23),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kPrimaryColor,
                    //onPressed: press,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
