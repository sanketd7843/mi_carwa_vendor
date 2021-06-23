import 'dart:convert';
import 'dart:developer';

import 'package:mi_carwa_vendor/constants.dart';
import 'package:mi_carwa_vendor/constants/apiUrls.dart';
import 'package:mi_carwa_vendor/models/userLoginModels/UserSignupModel.dart';
import 'package:mi_carwa_vendor/screens/NearbyScreen/nearby_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/screens/SignupSignin/widgets/snackbar.dart';
import 'package:mi_carwa_vendor/constants/sharedHelpers.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();
  final FocusNode focusFullName = FocusNode();
  final FocusNode focusReferalCode = FocusNode();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;
  bool isLoading = false;
  sharedHelpers sharedHelper = sharedHelpers();

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();
  TextEditingController signupFullNameController = TextEditingController();
  TextEditingController signupReferalCodeController = TextEditingController();

//registerUser
  Future registerUser() async {
    log("hello");
    try {
      FormData formData = FormData.fromMap(
        {
          "email": signupEmailController.text,
          "password": signupPasswordController.text,
          "user_fullname": signupFullNameController.text,
          "api_key": apiUrls.apiKey,
          "user_type": "1",
        },
      );
      Response resp = await Dio().post(apiUrls.registerUrl, data: formData);
      UserSignupModel u = UserSignupModel.fromJson(json.decode(resp.data));
      log(u.response + u.message);
      if (u.response == "200") {
        List<Data> udata = u.data;
        log("hello world" + json.encode(udata[0]));
        saveUserData(udata[0]);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => NearbyScreen()));
      }
    } on DioError catch (e) {
      log(e.toString());
    }
  }

  void saveUserData(dynamic data) async {
    sharedHelper.saveSharedPreferencesValue("VendorData", json.encode(data));
  }

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    focusFullName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 15.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 300.0,
                      height: h * 0.40,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 20.0,
                                  left: 25.0,
                                  right: 25.0),
                              child: TextField(
                                focusNode: focusFullName,
                                controller: signupFullNameController,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0),
                                ),
                                onSubmitted: (_) {
                                  focusReferalCode.requestFocus();
                                },
                              ),
                            ),
                            Container(
                              width: 250.0,
                              height: 1.0,
                              color: Colors.grey[400],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 20.0,
                                  left: 25.0,
                                  right: 25.0),
                              child: TextField(
                                focusNode: focusReferalCode,
                                controller: signupReferalCodeController,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Referal Code',
                                  hintStyle: TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0),
                                ),
                                onSubmitted: (_) {
                                  focusNodeEmail.requestFocus();
                                },
                              ),
                            ),
                            Container(
                              width: 250.0,
                              height: 1.0,
                              color: Colors.grey[400],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 20.0,
                                  left: 25.0,
                                  right: 25.0),
                              child: TextField(
                                focusNode: focusNodeEmail,
                                controller: signupEmailController,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.attach_money,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0),
                                ),
                                onSubmitted: (_) {
                                  focusNodePassword.requestFocus();
                                },
                              ),
                            ),
                            Container(
                              width: 250.0,
                              height: 1.0,
                              color: Colors.grey[400],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 20.0,
                                  left: 25.0,
                                  right: 25.0),
                              child: TextField(
                                focusNode: focusNodePassword,
                                controller: signupPasswordController,
                                obscureText: _obscureTextPassword,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0),
                                  suffixIcon: GestureDetector(
                                    onTap: _toggleSignup,
                                    child: Icon(
                                      _obscureTextPassword
                                          ? Icons.remove_red_eye
                                          : Icons.close,
                                      size: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onSubmitted: (_) {},
                              ),
                            ),
                            Container(
                              width: 250.0,
                              height: 1.0,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: kPrimaryColor,
                            offset: Offset(1.0, 6.0),
                          ),
                          BoxShadow(
                            color: kPrimaryColor,
                            offset: Offset(1.0, 6.0),
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: <Color>[kPrimaryColor, kPrimaryColor],
                        ),
                      ),
                      child: MaterialButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 42.0),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontFamily: 'WorkSansBold'),
                          ),
                        ),
                        onPressed: () => registerUser(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSignUpButton() {
    CustomSnackBar(context, const Text('SignUp button pressed'));
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }
}
