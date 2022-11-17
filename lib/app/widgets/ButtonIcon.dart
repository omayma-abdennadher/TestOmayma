


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {

  final String? buttonText;
  final Color?  titleColor,backgroundColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final IconData? icon;
  final dynamic? onPressed;
  final double radius;
  const ButtonIcon({
    Key? key,
    this.buttonText,
    this.onPressed,
    this.icon,
    this.backgroundColor,
    this.titleColor,
    this.fontWeight ,
    this.fontSize ,
    this.radius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          color: backgroundColor?? Colors.white,
            child:


        ElevatedButton.icon(
          icon:  Icon( icon,
            color: Colors.white,
          ),
          onPressed: onPressed,
          label: Text(
          buttonText!,
            style:  TextStyle(fontWeight: fontWeight,fontSize: fontSize, color: titleColor?? Colors.white,),
          ),

        )




    );
  }
}
