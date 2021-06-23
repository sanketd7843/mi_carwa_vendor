import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/screens/NearbyScreen/nearby_screen.dart';
import 'package:mi_carwa_vendor/screens/OrderCancelledScreen/components/cancelledScreenBody.dart';
import 'package:mi_carwa_vendor/screens/OrderScreen/components/body.dart';
import 'package:mi_carwa_vendor/screens/ShopsScreen/shops_screen.dart';
import 'package:mi_carwa_vendor/screens/ProfileScreen/profile_screen.dart';
import 'package:mi_carwa_vendor/screens/WalletScreen/WalletScreen.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPackage(),
    );
  }
}

class MyPackage extends StatefulWidget {
  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    NearbyScreen(),
    OrderScreenBody(),
    CancelledScreenBody(),
    ShopsScreen(),
    ProfileScreen(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = NearbyScreen(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.account_balance_wallet_rounded),
        onPressed: () {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            NearbyScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? kPrimaryColor : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color:
                                currentTab == 0 ? kPrimaryColor : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            OrderScreenBody(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.history,
                          color: currentTab == 1 ? kPrimaryColor : Colors.grey,
                        ),
                        Text(
                          'Appointments',
                          style: TextStyle(
                            color:
                                currentTab == 1 ? kPrimaryColor : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ShopsScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_bag_rounded,
                          color: currentTab == 2 ? kPrimaryColor : Colors.grey,
                        ),
                        Text(
                          'Shops',
                          style: TextStyle(
                            color:
                                currentTab == 2 ? kPrimaryColor : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfileScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: currentTab == 3 ? kPrimaryColor : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color:
                                currentTab == 3 ? kPrimaryColor : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
