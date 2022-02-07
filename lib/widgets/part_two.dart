import 'package:flutter/material.dart';

import '../screens/new_blogs_screen.dart';

class PartTwo extends StatelessWidget {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: deviceHeight(context) * 0.7385,
        // color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You don\'t have any blog',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff474747),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NewBlogScrren.routeName);
                },
                padding: EdgeInsets.all(0.0),
                child: const Text(
                  'Let\'s create a blog',
                  style: TextStyle(
                    color: Color(0xff0D638A),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
