import 'package:flutter/material.dart';
import 'package:mi_carwa_vendor/components/text_field_container.dart';
import 'package:mi_carwa_vendor/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.mail,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
