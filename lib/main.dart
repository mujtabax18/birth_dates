import 'package:birth_dates/Screens/calender_screen.dart';
import 'package:birth_dates/Screens/home_screen.dart';
import 'package:birth_dates/Screens/specificbirthdaydetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
      routes: {
        HomeScreen.id:(context)=>HomeScreen(),
        CalenderScreen.id: (context)=>CalenderScreen(),
        SpecificBirthdayDetails.id:(context)=>SpecificBirthdayDetails(),
      },
    );
  }
}