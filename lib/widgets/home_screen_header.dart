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
          left: deviceWidth(context) * 0.07,
          right: deviceWidth(context) * 0.07,
        ),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: deviceHeight(context) * 0.065,
                ),
                const Text(
                  'My Blogs    ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const Text(
                  'Create and post blogs',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff474747),
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                SizedBox(
                  height: deviceHeight(context) * 0.087,
                ),
                const Icon(
                  Icons.circle,
                  size: 12,
                ),
              ],
            ),
            const Text(
              'blog',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff0D638A),
                fontSize: 29,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
