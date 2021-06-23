import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/constants.dart';

class EditShopInformationScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: new Text(
          'Edit Shop Details',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(height: 70),
                Padding(
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Shop Name',
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
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "Alex Shop",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 17.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Shop Address',
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
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "Nagpur",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 17.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Shop Latitude',
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
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "23.14781",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 17.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Shop Longitude',
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
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "23.14124",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 17.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Shop Contact Number',
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
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "9876543210",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 17.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Opening Time',
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
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "12:30",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 17.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Closing Time',
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
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "7:30",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 17.0, right: 25.0, top: 20.0),
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
                    padding: EdgeInsets.only(left: 17.0, right: 25.0, top: 0.0),
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
