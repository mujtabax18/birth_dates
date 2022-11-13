import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:birth_dates/Widgets/customappbar.dart';
import 'package:birth_dates/Widgets/floatingactionbuttondiamond.dart';
import 'package:birth_dates/Widgets/custombottomnavigatonbar.dart';
import 'package:birth_dates/Screens/specificbirthdaydetail.dart';


class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);
  static String id='CalenderScreen';

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {

  int _navSelectedIndex=1;
  void navBarTapped(){
    if(_navSelectedIndex==0){
      Navigator.pushNamed(context, CalenderScreen.id);
    }else if(_navSelectedIndex==1){
      Navigator.pushNamed(context, SpecificBirthdayDetails.id);
    }

  }


  DateTime focusday=DateTime.utc(2020,10,10);
  DateTime? selectedDay;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButtonDiamond(),
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
            body:Column(
              children: [
                Container(
                  height: mediaQuery.height/1.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                    )
                  ),
                  child: Column(
                    children: [
                      CustomAppBar(mediaQuery: mediaQuery),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Octuber 2020',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),),
                        IconButton(
                            onPressed: (){},
                            icon: Image.asset('images/monthdropdown.png')
                        )
                      ],),
                      SizedBox(height: 10,),
                      Text('Swipe to choose month',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff989696),
                        fontWeight: FontWeight.w400,
                      )),
                      SizedBox(height: 2,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TableCalendar(
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: true,
                            todayTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          selectedDecoration: BoxDecoration(
                            color: Color(0xffEB4E5E),
                            shape: BoxShape.circle,
                          ),
                          ),

                            selectedDayPredicate: (day) {
                              return isSameDay(selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                selectedDay = selectedDay;
                                focusday = focusedDay; // update `_focusedDay` here as well
                              });
                            },
                            focusedDay:selectedDay?? focusday,
                            headerVisible: false,
                            firstDay: DateTime.utc(1997,10,11),
                            lastDay: DateTime.utc(2090,10,11)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('11 Octuber 2022',
                  style:  TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff989696),
                    fontWeight: FontWeight.w500,
                  )),
                ),
                Container(
                  height: mediaQuery.height/10.9,
                  width: mediaQuery.width/1.18,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
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
                                image: AssetImage('images/cardimage.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sarah Williams',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                SizedBox(height: 2,),
                                Row(
                                  children: [
                                    Icon(Icons.list,
                                      color: Color(0xff989696),
                                      size: 14,
                                    ),
                                    Text('07.01.1997',
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
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('12 Days to go',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffEB4E5E),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: mediaQuery.height/10.9,
                  width: mediaQuery.width/1.18,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
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
                                image: AssetImage('images/cardimage.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sarah Williams',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                SizedBox(height: 2,),
                                Row(
                                  children: [
                                    Icon(Icons.list,
                                      color: Color(0xff989696),
                                      size: 14,
                                    ),
                                    Text('07.01.1997',
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
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('12 Days to go',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffEB4E5E),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),),
                    ],
                  ),
                ),
              ],
            )
        ),
    );
  }
}
