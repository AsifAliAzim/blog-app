import 'package:flutter/material.dart';

class NewBlogScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    return Container(
      height: deviceHeight(context) * 0.17,
      child: Padding(
        padding: EdgeInsets.only(
          left: deviceWidth(context) * 0.07,
          right: deviceWidth(context) * 0.07,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: deviceHeight(context) * 0.065,
                ),
                Row(
                  children: [
                    const Text(
                      'New Blogs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth(context) * 0.425,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'assets/images/Icon ionic-ios-close-circle.png',
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Enter the information below to create your blog',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff474747),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
