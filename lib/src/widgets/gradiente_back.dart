import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {

  String title = "Popular";
  double height = 0.0;

  GradientBack(this.title, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blueGrey,
                Colors.deepPurple
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
          )
      ),

      alignment: const Alignment(-0.9, -0.6),

      child: Text(
        title,
        style: const  TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}