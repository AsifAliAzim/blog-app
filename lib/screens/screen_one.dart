import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jmm_task/helper/authentication_helper.dart';
import 'package:jmm_task/screens/authentication_screen.dart';

import '../widgets/part_two.dart'; //dont remove it!
import '../widgets/home_screen_header.dart';
import '../widgets/blogs_list.dart';
import 'new_blogs_screen.dart';

class ScreenOne extends StatefulWidget {
  static const routeName = '/sign-one';

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  int _currentIndex = 0;
  final tabs = [
    Column(
      children: [
        HomeScreenHeader(),
        SingleChildScrollView(
          child: Column(
            children: [
              Blogs(),

              //PartTwo(), //initial Screen
            ],
          ),
        )
      ],
    ),
    const Center(
      child: Text(
        'Searching.....',
        style: TextStyle(
          color: const Color(0xff0D638A),
          fontWeight: FontWeight.w500,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Profile...',
        style: TextStyle(
          color: const Color(0xff0D638A),
          fontWeight: FontWeight.w500,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RawMaterialButton(
        onLongPress: () {
          AuthenticationHelper().signOut();
          setState(() {});
        },
        onPressed: () {
          Navigator.of(context).pushNamed(NewBlogScrren.routeName);
          print('User loged out......');
        },
        elevation: 2.0,
        fillColor: Colors.white,
        child: Icon(
          Icons.add,
          size: deviceHeight(context) * 0.035, //35.0,
          color: const Color(0xff0D638A),
        ),
        padding: EdgeInsets.all(
          deviceHeight(context) * 0.02, //15.0,
        ),
        shape: CircleBorder(
            side: BorderSide(
          color: const Color(0xff0D638A),
          width: deviceWidth(context) * 0.006, //2,
        )),
      ),
      bottomNavigationBar: SizedBox(
        height: deviceHeight(context) * 0.09,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff0D638A),
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xff5FA5C5), //#5FA5C5
          currentIndex: _currentIndex,

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: deviceHeight(context) * 0.045,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: deviceHeight(context) * 0.045,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                size: deviceHeight(context) * 0.045,
              ),
              label: '',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      body: tabs[_currentIndex],
    );
  }
}
