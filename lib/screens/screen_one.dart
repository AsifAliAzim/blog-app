import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../helper/authentication_helper.dart';
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

  // int _currentIndex = 0;
  final tabs = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeScreenHeader(),
        Column(
          children: [
            Blogs(), //It the user is logined in for the first time then show PartTwo()
            //check the user collection and search for login user if has blog then show the blog
            //if not then show PartTwo() widget here.....
          ],
        ),
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
        onLongPress: () async {
          AuthenticationHelper().signOut();
          setState(() {});
        },
        onPressed: () {
          Navigator.of(context).pushNamed(NewBlogScrren.routeName);
        },
        elevation: 2.0,
        fillColor: Colors.white,
        child: Icon(
          Icons.add,
          size: deviceHeight(context) * 0.035,
          color: const Color(0xff0D638A),
        ),
        padding: EdgeInsets.all(
          deviceHeight(context) * 0.02,
        ),
        shape: CircleBorder(
            side: BorderSide(
          color: const Color(0xff0D638A),
          width: deviceWidth(context) * 0.006,
        )),
      ),
      bottomNavigationBar: SizedBox(
        height: deviceHeight(context) * 0.09,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff0D638A),
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xff5FA5C5),
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
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: HomeScreenHeader(),
          ),
          Expanded(
            flex: 6,
            child: Blogs(),
          ), //PartTwo(), //initial Screen
        ],
      ),
      //SingleChildScrollView(child: tabs[_currentIndex]),
    );
  }
}
