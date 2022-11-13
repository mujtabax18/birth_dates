import 'package:flutter/material.dart';
import 'package:diamond_dial_fab/diamond_dial_fab.dart';
import 'package:diamond_dial_fab/diamond_dial_fab_child.dart';
class FloatingActionButtonDiamond extends StatelessWidget {
  const FloatingActionButtonDiamond({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){},

      child: Icon(Icons.add),
      backgroundColor: Color(0xffFC3545),

    );
  }
}
