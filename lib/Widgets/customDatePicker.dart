import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({Key? key,
    required this.texthint,
  }) : super(key: key);
  final String texthint;
  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Choose a date...', style: TextStyle(color: Color(0xffEB4E5E))),
          ImageIcon(AssetImage('images/Calendar.png'),color: Color(0xffEB4E5E)),
        ],
      ),
    )
    ;
  }
}


