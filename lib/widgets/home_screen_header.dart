import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    return Container(
      height: deviceHeight(context) * 0.17,
      // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(
          left: deviceWidth(context) * 0.02,
          right: deviceWidth(context) * 0.07,
          top: deviceHeight(context) * 0.02,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  'My Blogs    ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                subtitle: Text(
                  'Create and post blogs',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff474747),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/Component 14 – 1.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
