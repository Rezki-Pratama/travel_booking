import 'package:flutter/material.dart';
import 'package:travel_booking/utilities/app_style.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;

  CircleButton({this.icon, this.onPressed, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              AppStyle.darkGrey,
              AppStyle.lightGrey,
            ],
          )),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          size: iconSize,
          color: Colors.white,
        ),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
      ),
    );
  }
}