import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/screens/SelectDayDateScreen/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: DetailScreenBody(),
  ));
}

class DetailScreenBody extends StatefulWidget {
  final String shopName;
  final String shopId;
  final String shopAddress;
  final String shopContactNumber;
  final String shopOpeningTime;
  final String shopClosingTime;
  final String shopDescription;
  final String vendorId;

  const DetailScreenBody(
      {Key key,
      this.shopName,
      this.shopId,
      this.shopAddress,
      this.shopContactNumber,
      this.shopOpeningTime,
      this.shopClosingTime,
      this.shopDescription,
      this.vendorId})
      : super(key: key);

  @override
  _DetailScreenBodyState createState() => _DetailScreenBodyState();
}

class _DetailScreenBodyState extends State<DetailScreenBody> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: new Text(
            'Vendor Detail',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: h * 1,
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/car.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 215),
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/car.png',
                              ),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: kWhiteColor,
                                spreadRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.shopName,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: RatingBarIndicator(
                              rating: 2.75,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 14.0,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            ),
                          ),
                          child: FlatButton(
                            child: Text('Description'),
                            onPressed: () => debugPrint('Description'),
                            textColor: Colors.black,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 2,
                          color: Colors.white,
                        ),
                        Container(
                          decoration:
                              BoxDecoration(color: Colors.grey.shade200),
                          child: FlatButton(
                            child: Text('Timing'),
                            onPressed: () => debugPrint('Timing'),
                            textColor: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 2,
                          color: Colors.white,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              )),
                          child: FlatButton(
                            child: Text('Reviews'),
                            onPressed: () => debugPrint('Reviews'),
                            textColor: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade100,
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                    ),
                    child: Text(
                      widget.shopDescription,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(18.0, 88.0, 18.0, 18.0),
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.grey.shade400,
                                      ),
                                      onPressed: () => launch(
                                          'tel://${widget.shopContactNumber}'),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 10,
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.location_on,
                                        color: Colors.grey.shade400,
                                      ),
                                      onPressed: () => MapsLauncher.launchQuery(
                                          widget.shopAddress),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 10,
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 3,
                                child: Container(
                                  width: 120,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: FlatButton(
                                      child: Text(
                                        'Book Now',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return MainPage(
                                                shopAddress: widget.shopAddress,
                                                shopClosingTime:
                                                    widget.shopClosingTime,
                                                shopContactNumber:
                                                    widget.shopContactNumber,
                                                shopDescription:
                                                    widget.shopDescription,
                                                shopId: widget.shopId,
                                                shopName: widget.shopName,
                                                shopOpeningTime:
                                                    widget.shopOpeningTime,
                                                vendorId: widget.vendorId);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
