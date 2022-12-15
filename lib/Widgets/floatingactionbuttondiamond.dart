import 'package:flutter/material.dart';
import 'package:birth_dates/Screens/addbirthday.dart';
class FloatingActionButtonDiamond extends StatelessWidget {
  const FloatingActionButtonDiamond({
    Key? key,
   required this.mediaQuery,
  }) : super(key: key);
   final Size mediaQuery;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){
      showModalBottomSheet(context: context,isScrollControlled:true,
          builder: (context)=>AddBirthDay(mediaQuery: mediaQuery));
    },
      child: Icon(Icons.add),
      backgroundColor: Color(0xffFC3545),
    );
  }
}
