import 'package:flutter/material.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.OnTap,
    required int navSelectedIndex,
  }) : _navSelectedIndex = navSelectedIndex, super(key: key);

  final Function(int) OnTap;
  final int _navSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarTheme(
      data: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(
            color: Color(0xffFC3545),
          )
      ),
      child: BottomNavigationBar(
        currentIndex: _navSelectedIndex,
         onTap: OnTap,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/Calendar.png'),
              ),
              label: 'Calender'
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('images/gift.png')
              ),
              label: 'Gify'
          )
        ],
      ),
    );
  }
}