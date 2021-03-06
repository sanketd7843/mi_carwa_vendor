import 'package:mi_carwa_vendor/model/history_model.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(TransactionsScreen());
}

class TransactionsScreen extends StatefulWidget {
  @override
  _PaymentDoneScreen createState() => _PaymentDoneScreen();
}

class _PaymentDoneScreen extends State<TransactionsScreen> {
  bool paymentdone = true;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: new Text(
          'Recent Transactions',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => {},
            child: Container(
              height: 106,
              margin: EdgeInsets.only(bottom: 13),
              padding:
                  EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
              decoration: BoxDecoration(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 4.0),
                        child: Text(
                          transactions[index].date,
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: kGreyColor),
                        ),
                      ),
                      Text(
                        transactions[index].photo,
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 4.0),
                        child: Text(
                          transactions[index].name,
                          style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: kBlackColor),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        transactions[index].amount,
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
