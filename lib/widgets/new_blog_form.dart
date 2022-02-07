import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../customization/remove_scroll_glow.dart';

class NewBlogForm extends StatefulWidget {
  @override
  _NewBlogFormState createState() => _NewBlogFormState();
}

class _NewBlogFormState extends State<NewBlogForm> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    final placeholderImage = buildImage('assets/images/Component 10 – 1.png');
    return SingleChildScrollView(
      reverse: true,
      child: Container(
        height: deviceHeight(context) - 149.9,
        child: Form(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                left: deviceWidth(context) * 0.03,
                right: deviceWidth(context) * 0.03,
              ),
              children: [
                buildDashBorder(
                  child: Container(
                    child: Stack(
                      children: [
                        placeholderImage,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Icon metro-file-upload.png',
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: const Text(
                                  'Upload header image',
                                  style: TextStyle(
                                    color: Color(0xff0D638A),
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    width: deviceWidth(context) * 0.85,
                    height: deviceHeight(context) * 0.2,
                  ),
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.04,
                ),
                const Text(
                  'Blog title',
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.01,
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.065,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Add you title',
                      fillColor: const Color(0xffFCFBFB),
                      filled: true,
                      labelStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.03,
                ),
                const Text(
                  'Text here',
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    fillColor: const Color(0xffFCFBFB),
                    filled: true,
                    labelStyle: const TextStyle(
                      fontSize: 24,
                      color: Color(0xff0D638A),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  maxLines: 15,
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.03,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: deviceHeight(context) * 0.02,
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.065,
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(ScreenOne.routeName);
                        },
                        child: Container(
                          child: const Center(
                            child: Text(
                              'Create',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff0D638A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.02,
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.065,
                      width: deviceWidth(context) * double.infinity,
                      child: TextButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xff0D638A),
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Color(0xff0D638A),
                            ),
                          )),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDashBorder({required Widget child}) => DottedBorder(
        color: Color(0xff0D638A),
        strokeWidth: 1,
        child: child,
        borderType: BorderType.RRect,
        dashPattern: const [10, 10],
        radius: const Radius.circular(12),
      );

  Widget buildImage(String placeholderImage) => Image.asset(
        placeholderImage,
        fit: BoxFit.contain,
        width: deviceWidth(context) * 0.95,
        height: deviceHeight(context) * 0.2,
      );
}
