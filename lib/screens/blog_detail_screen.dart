import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jmm_task/customization/remove_scroll_glow.dart';

class BlogDetailScreen extends StatelessWidget {
  DateFormat date;
  String title;
  String description;
  String image;

  BlogDetailScreen(
    this.date,
    this.title,
    this.description,
    this.image,
  );
  final dateFormat = DateFormat('dd/MM/yyyy');

  static const routeName = '/blog-detail';

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: deviceHeight(context) * 0.3,
            width: double.infinity,
            color: Colors.grey,
            child: Stack(
              children: [
                Image.network(
                  image,
                  height: deviceHeight(context) * 0.3,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: deviceHeight(context) * 0.14,
                    width: deviceWidth(context) * 0.15,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: deviceHeight(context) * 0.055,
                        ),
                        Image.asset(
                          'assets/images/Icon ionic-ios-arrow-round-back.png',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: deviceHeight(context) * 0.015,
          ),
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Divider(
                thickness: deviceHeight(context) * 0.002,
                color: Color(0xffDBDBDB),
              ),
              Container(
                height: deviceHeight(context) * 0.07,
                color: Colors.grey[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: deviceWidth(context) * 0.03,
                      ),
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff474747),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: deviceWidth(context) * 0.03,
                      ),
                      child: Text(
                        date.format(DateTime.now()),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff646464),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: deviceHeight(context) * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: deviceWidth(context) * 0.04,
              right: deviceWidth(context) * 0.05,
            ),
            child: Container(
              height: deviceHeight(context) * 0.595,
              width: deviceWidth(context),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff646464),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
