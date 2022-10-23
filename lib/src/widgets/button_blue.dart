import 'package:flutter/material.dart';

class ButtonBlue extends StatefulWidget{

  final String text;
  double width;
  double height;
  final VoidCallback onPressed;

  ButtonBlue({required this.text, required this.onPressed, this.width = 0.0, this.height = 0.0});

  @override
  State<StatefulWidget> createState() {
    return _ButtonGreen();
  }
}

class _ButtonGreen extends State<ButtonBlue>{
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.only(
            top:  30.0,
            left: 20.0,
            right: 20.0
        ),
        height: widget.height,
        width: widget.width,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
                colors: [
                  Colors.indigoAccent,
                  Colors.deepPurple,
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0,0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            )
        ),

        child: Center(
          child: Text(
            widget.text,
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