import 'dart:developer';
import 'dart:convert';
import 'package:mi_carwa_vendor/constants/alertHelper.dart';
import 'package:mi_carwa_vendor/constants/appStringsHelper.dart';
import 'package:mi_carwa_vendor/constants/sharedHelpers.dart';
import 'package:mi_carwa_vendor/constants/validatorHelper.dart';
import 'package:mi_carwa_vendor/screens/HomeScreen/home_screen.dart';
import 'package:mi_carwa_vendor/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mi_carwa_vendor/constants/apiUrls.dart';
import 'package:mi_carwa_vendor/models/userLoginModels/UserLoginModel.dart';
import 'package:mi_carwa_vendor/networking/HttpService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/screens/SignupSignin/widgets/snackbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  HttpService httpService = HttpService();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool isLoading = false;
  String fcm_k;
  sharedHelpers sharedHelper = sharedHelpers();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future loginUser() async {
    _firebaseMessaging.getToken().then((String fcm) => fcm_k = fcm);
    log("hello fcmkey" + fcm_k);
    var umail = loginEmailController.text;
    var upassword = loginPasswordController.text;

    if (umail == "" ||
        upassword == "" ||
        !(validatorHelper().validateEmail(umail))) {
      var dialog = CustomAlertDialog(
          title: "Alert",
          message: appStringsHelper.emptyFields,
          negativeBtnText: 'Ok');
      showDialog(context: context, builder: (BuildContext context) => dialog);
    } else {
      isLoading = true;
      try {
        FormData formData = FormData.fromMap({
          "email": umail,
          "password": upassword,
          "api_key": apiUrls.apiKey,
          "user_type": "1",
          "fcm_key": fcm_k
        });
        isLoading = false;
        Response resp = await Dio().post(apiUrls.loginUrl, data: formData);
        UserLoginModel u = UserLoginModel.fromJson(json.decode(resp.data));
        log(u.response + u.message);
        if (u.response == "200") {
          List<UserData> udata = u.data;
          log("hello world" + json.encode(udata[0]));
          saveUserData(udata[0]);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen()));
        } else {
          var dialog = CustomAlertDialog(
              title: "Alert", message: u.message, negativeBtnText: 'Ok');
          showDialog(
              context: context, builder: (BuildContext context) => dialog);
        }
      } on DioError catch (e) {
        log(e.toString());
      }
    }
  }

  void saveUserData(dynamic data) async {
    sharedHelper.saveSharedPreferencesValue("userData", json.encode(data));
  }

  @override
  void initState() {
    super.initState();
  }

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isApiCallProcess = false;
    return Container(
      padding: const EdgeInsets.only(top: 43.0),
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
                child: Container(
                  width: 300.0,
                  height: 190.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusNodeEmail,
                          controller: loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontFamily: 'WorkSansSemiBold',
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.mail,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
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
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusNodePassword,
                          controller: loginPasswordController,
                          obscureText: _obscureTextPassword,
                          style: const TextStyle(
                              fontFamily: 'WorkSansSemiBold',
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              Icons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleLogin,
                              child: Icon(
                                _obscureTextPassword
                                    ? Icons.remove_red_eye
                                    : Icons.close,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onSubmitted: (_) {
                            loginUser();
                          },
                          textInputAction: TextInputAction.go,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isLoading == true
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(child: CircularProgressIndicator()))
                  : Container(),
              Container(
                margin: const EdgeInsets.only(top: 170.0),
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
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: 'WorkSansBold'),
                      ),
                    ),
                    onPressed: () => {
                          loginUser(),
                        }),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansMedium'),
                )),
          ),
        ],
      ),
    );
  }

  @override
  void init() {
    super.initState();
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
