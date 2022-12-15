import 'package:flutter/material.dart';


class TextButtonRectangular extends StatelessWidget {
 TextButtonRectangular({required this.onPress,
   this.btnTextColor=Colors.white,
    this.btncolor=Colors.lightBlueAccent,
   this.btnheight=50.0,
   this.btnText='button',
   this.btnTextSize=20.0,
 });
  final VoidCallback onPress;
  final double btnheight;
  final Color btncolor;
  final String btnText;
  final Color btnTextColor;
  final double btnTextSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: btncolor,
            borderRadius: BorderRadius.all(Radius.circular(12.0))
          ),
          alignment: Alignment.center,
          height: btnheight,
          width: double.infinity,
          
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 20.0,
              color: btnTextColor,
            ),
          ),
        ));
  }
}
