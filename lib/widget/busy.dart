
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BusyOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: Material(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor:Colors.red,
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );

  }
}