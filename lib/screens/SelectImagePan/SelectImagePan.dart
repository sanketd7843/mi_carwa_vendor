import 'dart:io';

import 'package:mi_carwa_vendor/components/rounded_button.dart';
import 'package:mi_carwa_vendor/components/rounded_input_field.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/screens/HomeScreen/home_screen.dart';
import 'package:mi_carwa_vendor/screens/KycDoneScreen/KycDoneScreen.dart';
import 'package:mi_carwa_vendor/screens/SelectImagePan/SelectImagePan.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(SelectPanCard());
}

class SelectPanCard extends StatefulWidget {
  @override
  _SelectPanCard createState() => _SelectPanCard();
}

class _SelectPanCard extends State<SelectPanCard> {
  File _image;

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
          'Upload Pan Card',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  // Center(
                  //   child: Text(
                  //     "Upload Pan Card",
                  //     style: TextStyle(
                  //         color: Colors.grey.shade800,
                  //         fontSize: 23,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _image != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            width: 300,
                            height: h * 0.31,
                            child: Image.file(
                              _image,
                            ),
                          ),
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(top: 48.0, bottom: 38.0),
                          child: Container(
                            width: 300,
                            height: h * 0.31,
                            child: Image.asset(
                              "assets/images/panCard.png",
                            ),
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // RaisedButton(
                      //   child: Text('Select Photo'),
                      //   onPressed: () {
                      //     showAlertDialog(context);
                      //   },
                      // ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                        onPressed: () => _getImage(ImageSource.gallery),
                        icon: Icon(Icons.image),
                        label: Text('gallery'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => _getImage(ImageSource.camera),
                        icon: Icon(Icons.camera),
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                        label: Text('camera'),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Center(
                    child: RoundedInputField(
                      icon: Icons.wallpaper,
                      hintText: "Enter Pan Number",
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28.0, 0.0, 28.0, 8.0),
                    child: RoundedButton(
                      text: "Upload Pan Card",
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return KycDoneScreen();
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
      ),
    );
  }

  _getImage(ImageSource imageSource) async {
    PickedFile imageFile = await picker.getImage(source: imageSource);

    if (imageFile == null) return;

    setState(
      () {
        _image = File(imageFile.path);
      },
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget galleryButton = FlatButton(
    child: Text("Gallery"),
    onPressed: () {
      //   _getImage(ImageSource.gallery);
    },
  );
  Widget cameraButton = FlatButton(
    child: Text("Camera"),
    onPressed: () {
      //     _getImage(ImageSource.camera);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Select Photo"),
    content: Text("Upload Pan card from the options given below"),
    actions: [
      galleryButton,
      cameraButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
