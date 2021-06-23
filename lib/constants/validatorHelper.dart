import 'dart:developer';

class validatorHelper {
  bool validateEmail(String mail) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(mail);
    log("has matched :" + emailValid.toString());
    return emailValid;
  }
}
