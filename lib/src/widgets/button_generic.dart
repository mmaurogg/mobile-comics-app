import 'package:flutter/material.dart';

class ButtonGeneric extends StatelessWidget {

  String buttonText;
  Color color;
  dynamic? onTap;

  ButtonGeneric({required this.buttonText, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(
            top:  30.0,
            left: 20.0,
            right: 20.0
        ),
        height: 50.0,
        width: 180.0,
        //
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: color,
        ),

        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),

    );
  }

}