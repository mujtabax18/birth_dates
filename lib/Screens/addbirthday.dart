import 'package:flutter/material.dart';
import 'package:birth_dates/Widgets/customtextfield.dart';
import 'package:birth_dates/Widgets/TextBottonRectangular.dart';
import 'package:birth_dates/Widgets/customDatePicker.dart';
class AddBirthDay extends StatelessWidget {
  const AddBirthDay({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);
final Size mediaQuery;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color(0xff757575),
      child: Container(
        height: mediaQuery.height -mediaQuery.height/9,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
           borderRadius: BorderRadius.only(
             topRight: Radius.circular(30),
             topLeft:  Radius.circular(30),
           ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              TextHeader(text: 'Add New Birthday'),
              CircleAvatar(
                child: Icon(Icons.person_outlined,
                    size: 29),
                radius: mediaQuery.height/21.15,
                backgroundColor: Color(0xffF5F5F5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPortionHeader(text: 'First Name',),
                  SizedBox(height: 10,),
                  CustomTextField(texthint: 'Type Name Here...',onChange: (value){}),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPortionHeader(text: 'Family Name'),
                  SizedBox(height: 10,),
                  CustomTextField(texthint: 'Type Name Here...',onChange: (value){}),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPortionHeader(text: "Gender"),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      CustomGenderRadioButton( mediaQuery: mediaQuery,
                          text: 'Male',
                      icon: Icons.male_outlined,
                        onpress: (){},
                      color: Color(0xffEB4E5E),
                      borderColor:  Color(0xffEB4E5E)),
                      SizedBox(width: 12,),
                      CustomGenderRadioButton( mediaQuery: mediaQuery,
                      text: 'Female',
                          icon: Icons.female_outlined,
                          onpress: (){},
                          color: Color(0xff989696),
                      borderColor: Colors.transparent,),

                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPortionHeader(text: 'Birth Date'),
                  SizedBox(height: 10,),
                 CustomDatePicker(texthint: 'Choose a date...', ),
                ],
              ),
              Column(
                children: [
                  TextButtonRectangular(onPress: (){},btnText: 'Add Birthday',btncolor: Color(0xffEB4E5E)),
                  TextButton(onPressed: (){}, child: Text('Close', style: TextStyle(color: Color(0xffEB4E5E),fontSize: 20),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextPortionHeader extends StatelessWidget {
  const TextPortionHeader({
    Key? key,
    required this.text
  }) : super(key: key);
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ));
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),);
  }
}

class CustomGenderRadioButton extends StatelessWidget {
  const CustomGenderRadioButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    required this.borderColor,
    required this.onpress,
    required this.mediaQuery,
  }) : super(key: key);
  final Size mediaQuery;
  final Color color;
  final Color borderColor;
  final String text;
  final IconData icon;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric( horizontal: mediaQuery.width/11, vertical: mediaQuery.height/50.2),
        decoration: BoxDecoration(
          color:  Color(0xffF5F5F5),
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: color,),
            Text(text,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: color,
                )),
          ],
        ),
      ),
    );
  }
}


