import 'package:flutter/material.dart';
import 'package:birth_dates/Widgets/customappbar.dart';
import 'package:birth_dates/Styles/colors.dart';
import 'package:birth_dates/Widgets/floatingactionbuttondiamond.dart';
import 'package:birth_dates/Widgets/custombottomnavigatonbar.dart';
import 'package:birth_dates/Screens/calender_screen.dart';
import 'package:birth_dates/Screens/home_screen.dart';

class SpecificBirthdayDetails extends StatefulWidget {
  const SpecificBirthdayDetails({Key? key}) : super(key: key);
  static String id='SpecificBirthdayDetails';

  @override
  State<SpecificBirthdayDetails> createState() => _SpecificBirthdayDetailsState();
}

class _SpecificBirthdayDetailsState extends State<SpecificBirthdayDetails> {
  int _navSelectedIndex=1;
  void navBarTapped(){
    if(_navSelectedIndex==0){
      Navigator.pushNamed(context, CalenderScreen.id);
    }else if(_navSelectedIndex==1){
      Navigator.pushNamed(context, HomeScreen.id);
    }

  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButtonDiamond(mediaQuery: mediaQuery),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:CustomBottomNavigationBar(
            navSelectedIndex: _navSelectedIndex,
            OnTap: (index){
              if(index!=_navSelectedIndex)
              {
                setState(() {
                  _navSelectedIndex=index;
                  navBarTapped();
                });
              }
            },
          ),
          backgroundColor: kColorsScreenBackGround,
          body:Column(
            children: [
              CustomAppBar(mediaQuery: mediaQuery),
              CardRemainingDays(
                  mediaQuery: mediaQuery,
              name: 'John',
              age: '21',
              days: '00',
                pimage: 'images/cardimage.png',
              ),
              SizedBox(
                height: mediaQuery.height/81.2,
              ),
              CardNameAndDOB(
                  mediaQuery: mediaQuery,
                name: 'John Doe',
                dateOfBirth: '08.10.1997',
                dateOfBirthIcon: 'images/cake.png',
                signText: 'Libra',
                signIcon: 'images/signlibra.png',
              ),
              SizedBox(
                height: mediaQuery.height/81.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WishesCard(
                      mediaQuery: mediaQuery,
                      imageBackgroundColor: kColorsWishesCard1BackGround,
                      image: 'images/GiftIdeas.png',
                      title: 'Gift Ideas',
                      description: 'Discover gift ideas for John'),
                  SizedBox(width: 24.0,),
                  WishesCard(
                      mediaQuery: mediaQuery,
                      imageBackgroundColor: kColorsWishesCard2BackGround,
                      image: 'images/SendPostCard.png',
                      title: 'Send Postcard',
                      description: 'Send John a Postcard      '),

                ],
              ),
              CardInfo(mediaQuery: mediaQuery,
                  image: 'images/InfoImage.png',
                  date: '8 October',
                  question: 'Did you know?',
                  desc: 'The famous Eiffle Tower in France was created'
                      'and launched for public. It costed \$2 billion as'
                      'for construction which lasted over 4 years.'),
            ],
          )
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.mediaQuery,
    required this.image,
    required this.date,
    required this.question,
    required this.desc,
  }) : super(key: key);

  final Size mediaQuery;
  final String image;
  final String date;
  final String question;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(top: 20),
      height: mediaQuery.height/5.4,
      width: mediaQuery.width/1.1,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
              fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date,
            style: TextStyle(
              color: kColorsCardInfoText,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          Text(question,
           style: TextStyle(
             fontSize: 24,
             fontWeight: FontWeight.w700,
             color: kColorsCardInfoText,
           )),
          Text(
            desc,
                style: TextStyle(
                  color:kColorsCardInfoText,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
          )
        ],
      ),
    );
  }
}

class WishesCard extends StatelessWidget {
  const WishesCard({
    Key? key,
    required this.mediaQuery,
    required this.imageBackgroundColor,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final Size mediaQuery;
  final Color imageBackgroundColor;
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery.height/4,
      width: mediaQuery.width/2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: mediaQuery.height/8,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13),
                topRight:  Radius.circular(13),
              ),
              color: imageBackgroundColor,
            ),
            child: Image.asset(image,
            height: mediaQuery.width/4.5,
            width: mediaQuery.width/4.5,),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(description,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kColorsWishCard1Description,
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardNameAndDOB extends StatelessWidget {
  const CardNameAndDOB({
    Key? key,
    required this.name,
    required this.dateOfBirth,
    required this.dateOfBirthIcon,
    required this.signIcon,
    required this.signText,
    required this.mediaQuery,
  }) : super(key: key);

  final String name;
  final String dateOfBirth;
  final String dateOfBirthIcon;
  final String signText;
  final String signIcon;
  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: mediaQuery.height/10,
     margin:  EdgeInsets.symmetric(horizontal: mediaQuery.width/18.75),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(mediaQuery.width/15.6))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),),
          SizedBox(height: mediaQuery.height/101.5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(dateOfBirthIcon,
                  width: 13,
                  height: 13,
                  color:kColorsCardNameAndDOB_DOBIconText, ),
              SizedBox(width: 4,),
              Text(
                dateOfBirth,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.61,
                  color: kColorsCardNameAndDOB_DOBIconText,
                ),
              ),
              SizedBox(width: mediaQuery.width/20.8,),
              Image.asset(signIcon,
              height: 13.61,
              width: 13.61,
            ),
              SizedBox(width: 4,),
              Text(signText,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.61,
                  color:kColorsCardNameAndDOB_DOBIconText,
                ),),
            ],
          ),
        ],
      ),
    );
  }
}

class CardRemainingDays extends StatelessWidget {
  const CardRemainingDays({
    Key? key,
    required this.mediaQuery,
    required this.pimage,
    required this.age,
    required this.name,
    required this.days,
  }) : super(key: key);

  final Size mediaQuery;
  final String name;
  final String age;
  final String days;
  final String pimage;

  List<Widget> SeperateDays(String days){

    List<Widget> daysTextList=[];
    for(int i=0; i<days.length; i++){
      daysTextList.add(
          Container(
            alignment: Alignment.center,
            height: 35,
            width: 33,
            decoration: BoxDecoration(
                color:kColorsCardRemainingDays_DaysNumberBackground,
                borderRadius: BorderRadius.all(Radius.circular(mediaQuery.width/25))
            ),
            child: Text(days[i],
              style: TextStyle(
                  color: kColorsCardRemainingDaysText,
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              ),),
          )
      );
    }
    daysTextList.add(Text('Days',   style: TextStyle(
      color: kColorsCardRemainingDaysText,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    )));
    return daysTextList;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: mediaQuery.height/5.5,
      margin: EdgeInsets.symmetric(horizontal: mediaQuery.width/19),
      decoration: BoxDecoration(
          color: kColorsCardRemainingDaysBackground,
          borderRadius: BorderRadius.all(Radius.circular(mediaQuery.width/13))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('$name is turning',
             style: TextStyle(
               color: kColorsCardRemainingDaysText,
               fontSize: 18,
               fontWeight: FontWeight.w400,
             ),
             ),
             Row(
               children: [
                 Text(age,
                  style: TextStyle(
                       color:kColorsCardRemainingDaysText,
                       fontSize: 30,
                       fontWeight: FontWeight.w700
                   ),),
                 Text('in',
                     style: TextStyle(
                       color: kColorsCardRemainingDaysText,
                       fontSize: 18,
                       fontWeight: FontWeight.w400,
                     )),
               ],
             ),
             Row(
               children: SeperateDays(days),
             ),
           ],
         ),
          SizedBox(width: 10,),
          CircleAvatar(
            radius: mediaQuery.width/10,
            backgroundColor: kColorsCardRemainingDaysImageBackGround,
            child: Image(
              image: AssetImage(pimage),
            ),
          ),
        ],
      ),
    );
  }
}

