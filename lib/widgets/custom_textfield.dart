import 'package:flutter/material.dart';
import 'package:travel_booking/utilities/app_style.dart';

class CustomTextField extends StatelessWidget {
  final Function validator, onSaved;
  final IconData iconData;
  final String name;
  final bool obsecureText, enabled;
  final Widget suffixIcon;
  final Color colorCard;
  final TextEditingController controller;
  final Key key;

  CustomTextField(
      {this.validator,
      this.onSaved,
      this.iconData,
      this.name = "",
      this.obsecureText = false,
      this.enabled,
      this.suffixIcon,
      this.colorCard,
      this.controller,
      this.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: AppStyle.lighterGrey.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              key: key,
              controller: controller,
              validator: validator,
              onSaved: onSaved,
              cursorColor: Colors.white,
              obscureText: obsecureText,
              enabled: enabled,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppStyle.lighterGrey, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 3)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red, width: 3)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red, width: 3)),
                  labelText: name,
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: suffixIcon)),
        ),
      ),
    );
  }
}
