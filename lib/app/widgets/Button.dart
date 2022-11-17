


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String? buttonText;
  final Color?  titleColor,backgroundColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double radius;
  final dynamic onPressed;
  const Button({
    Key? key,
    this.buttonText,
    this.backgroundColor,
    this.titleColor,
    this.fontWeight ,
    this.onPressed ,
    this.fontSize ,
    this.radius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: onPressed,
      child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            color: backgroundColor?? Colors.white,
              child:

                  Center(
                    child:
                        Text(
                          buttonText.toString(),style: TextStyle(fontWeight: fontWeight,fontSize: fontSize, color: titleColor?? Colors.white,),
                              ),
                        ),




      ),
    );
  }
}
