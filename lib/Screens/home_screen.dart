import 'package:birth_dates/Screens/specificbirthdaydetail.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:birth_dates/Widgets/customappbar.dart';
import 'package:birth_dates/Widgets/floatingactionbuttondiamond.dart';
import 'package:birth_dates/Widgets/custombottomnavigatonbar.dart';
import 'package:birth_dates/Screens/calender_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  int cardindicator=0;
  final CarouselController _cardcontroller = CarouselController();
  List<int> cardpage=[0,2,4];
  final List<String> upname=['Sarah Williams','Henry L.','Sarah Williams','Henry L.',
    'Sarah Williams','Henry L.',];
  final List<String> upbirthDate=['07.01.1997','04.10.1997','07.01.1997','04.10.1997',
    '07.01.1997','04.10.1997',];
  final List<String> updays=['12','20','12','20','12','20',];
  final List<String> upimage=['images/cardimage.png','images/cardimage1.png','images/cardimage.png','images/cardimage1.png',
    'images/cardimage.png','images/cardimage1.png',];
  final String updateOfBirthIcon='images/cake.png';
int _navSelectedIndex=1;


void navBarTapped(){
        if(_navSelectedIndex==0){
          Navigator.pushNamed(context, CalenderScreen.id);
        }else if(_navSelectedIndex==1){
          Navigator.pushNamed(context, HomeScreen.id);
        }
}
    int _selectedCarouseSliderCard=-1;

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
          backgroundColor: Color(0xffE5E5E5),
           body: Column(
             children: [
               CustomAppBar(mediaQuery: mediaQuery),
               CardBirthdayTop(mediaQuery: mediaQuery,
                   Ontap: (){Navigator.pushNamed(context, SpecificBirthdayDetails.id);},
                   remainingDays: '4',
                   name: 'Johan', image: 'images/cardimage.png'),
               MonthAndUpcoming(mediaQuery: mediaQuery,
                   month: 'Octuber',
                   upcoming: 'Upcoming'),
               UpcomingSliderCarouse(cardcontroller: _cardcontroller,
                   mediaQuery: mediaQuery,
                   cardpage: cardpage, image: upimage,
                   name: upname, dateOfBirthIcon: updateOfBirthIcon,
                   birthDate: upbirthDate, days: updays,
                   cardindicator: cardindicator,
               onChanged: (index,_){
                 setState(() {
                   cardindicator=index;
                 });
               },
               ),
               const DiscoverText(),
               Container(
                 margin: EdgeInsets.symmetric(horizontal: 20),
                 height: mediaQuery.height/4.14,
               child: ListView(
                 scrollDirection: Axis.horizontal,
                  children: [
                    DiscoverCard(mediaQuery: mediaQuery,
                        image: "images/Rectangle 1777.png",
                        title: 'Trending \nGifts',
                        btnText: 'Explore',
                      OnPress: (){},
                    ),
                    DiscoverCard(mediaQuery: mediaQuery,
                      image: "images/Rectangle 17771.png",
                      title: 'Blog \nPosts',
                      btnText: 'Explore',
                      OnPress: (){},
                    ),
                  ],
               ),
               ),
             ],
           ),
      ),
    );
  }
}

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({
    Key? key,
    required this.mediaQuery,
    required this.image,
    required this.title,
    required this.btnText,
    required this.OnPress,
  }) : super(key: key);

  final Size mediaQuery;
  final String image;
  final String title;
  final String btnText;
  final VoidCallback OnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuery.width/2,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child:   Container(
        alignment: Alignment.bottomCenter,
        height: mediaQuery.height/4.6,
        width: mediaQuery.width/2,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image,),
              fit: BoxFit.fill,
            ),
            color: Color(0xff000000),
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                  onPressed:OnPress,
                  child:  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(btnText,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffFC3545),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),)
              )
            ],
          ),
        ),

      ),
    );
  }
}

class DiscoverText extends StatelessWidget {
  const DiscoverText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text('Discover',
      style: TextStyle(
        fontSize: 20,
          fontWeight: FontWeight.w700
      ),),
    );
  }
}

class UpcomingSliderCarouse extends StatelessWidget {
  const UpcomingSliderCarouse({
    Key? key,
    required CarouselController cardcontroller,
    required this.mediaQuery,
    required this.cardpage,
    required this.image,
    required this.name,
    required this.dateOfBirthIcon,
    required this.birthDate,
    required this.days,
    required this.cardindicator,
    required this.onChanged,
  }) : _cardcontroller = cardcontroller, super(key: key);

  final CarouselController _cardcontroller;
  final Size mediaQuery;
  final List<int> cardpage;
  final List<String> image;
  final List<String> name;
  final String dateOfBirthIcon;
  final List<String> birthDate;
  final List<String> days;
  final int cardindicator;
  final Function(int,CarouselPageChangedReason) onChanged;
  //final VoidCallback OnTapCard;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _cardcontroller,
          options: CarouselOptions(
              height: mediaQuery.height/4.5,
              enableInfiniteScroll: false,
              onPageChanged: onChanged,
          ),
          items: cardpage.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: mediaQuery.width/1.18,
                    margin: EdgeInsets.symmetric(
                        horizontal: mediaQuery.width/46.8),
                    child:   Column(
                        children: [
                          CarouseSliderCard(mediaQuery: mediaQuery,
                              image: image[i], name: name[i],
                              dateOfBirthIcon: dateOfBirthIcon,
                              birthDate: birthDate[i], days: days[i],
                          OnTap: (){
                          Navigator.pushNamed(context, SpecificBirthdayDetails.id);
                          },
                          ),
                          CarouseSliderCard(mediaQuery: mediaQuery,
                              image: image[i+1], name: name[i+1],
                              dateOfBirthIcon: dateOfBirthIcon,
                              birthDate: birthDate[i+1], days: days[i+1]
                          ,OnTap: (){Navigator.pushNamed(context, SpecificBirthdayDetails.id);},
                          ),

                        ])
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cardpage.asMap().entries.map((entry) {
            return GestureDetector(
              child: Container(
                width: 6.67,
                height: 6.67,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(cardindicator == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CarouseSliderCard extends StatelessWidget {
  const CarouseSliderCard({
    Key? key,
    required this.mediaQuery,
    required this.image,
    required this.name,
    required this.dateOfBirthIcon,
    required this.birthDate,
    required this.days,
    required this.OnTap,
  }) : super(key: key);

  final Size mediaQuery;
  final String image;
  final String name;
  final String dateOfBirthIcon;
  final String birthDate;
  final String days;
  final VoidCallback OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
       child: Container(
          margin: EdgeInsets.only(bottom: mediaQuery.height/81.2),
          height: mediaQuery.height/10.9,
          width: mediaQuery.width/1.18,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(16.0))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 24.0,
                      backgroundColor: Colors.white,
                      child: Image(
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),),
                        SizedBox(height: 2,),
                        Row(
                          children: [
                            Image.asset(dateOfBirthIcon,
                              width: 13,
                              height: 13,
                              color:Color(0xff989696), ),
                            SizedBox(width: 3,),
                            Text(birthDate,
                              style: TextStyle(
                                color: Color(0xff989696),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              SizedBox(width: 10,),
              Container(
                padding: EdgeInsets.all(4.0),
                child: Text('${days} Days to go',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffEB4E5E),
                  borderRadius: BorderRadius.all(Radius.circular(21.0)),
                ),),
            ],
          ),
        )
    );
  }
}

class MonthAndUpcoming extends StatelessWidget {
  const MonthAndUpcoming({
    Key? key,
    required this.mediaQuery,
    required this.month,
    required this.upcoming,
  }) : super(key: key);

  final Size mediaQuery;
  final String month;
  final String upcoming;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: mediaQuery.height/81.2),
          child:
          Text(month,
            style: TextStyle(
              color: Color(0xff989696),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: mediaQuery.height/81.3),
          child: Text( upcoming,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),),
        ),
      ],
    );
  }
}

class CardBirthdayTop extends StatelessWidget {
  const CardBirthdayTop({
    Key? key,
    required this.mediaQuery,
    required this.remainingDays,
    required this.name,
    required this.image,
    required this.Ontap,
  }) : super(key: key);

  final Size mediaQuery;
  final String remainingDays;
  final String name;
  final String image;
  final VoidCallback Ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: mediaQuery.width/18.75 ),
        alignment: Alignment.center,
        height: mediaQuery.height/5.5,
        decoration: BoxDecoration(
            color: Color(0xffEB4E5E),
          borderRadius: BorderRadius.all(Radius.circular(24.0))
        ),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
        remainingDays,
        style: TextStyle(
          color: Colors.white,
          fontSize: 55.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      Padding(
        padding:  EdgeInsets.all(mediaQuery.width/46.875),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Days to go until',
          style: TextStyle(
            color: Colors.white,
             fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
          ),
            Text('$name’s Birthday',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),),
          ],
        ),
      ),
      CircleAvatar(
        radius: mediaQuery.width/9.9,
        backgroundColor: Colors.white,
        child: Image(
          image: AssetImage(image),
        ),
      )
      ],
    ),
      ),
    );
  }
}
