import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,
  required this.texthint,
  required this.onChange,
  }) : super(key: key);
  final String texthint;
  final Function(String) onChange;
  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color(0xffEB4E5E),
          width: 1,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          filled:  true,
          fillColor: Color(0xffF5F5F5),
          hintText: texthint,
          border: myinputborder(), //normal border
         // enabledBorder: myinputborder(), //enabled border
          focusedBorder: myfocusborder(), //focused border
          // set more border style like disabledBorder
        ),
      onChanged: onChange,
    );
  }
}
