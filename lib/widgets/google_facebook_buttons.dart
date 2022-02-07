import 'package:flutter/material.dart';

class GoogleFacebookButtons extends StatelessWidget {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const Divider(
              color: Colors.grey,
            ),
            Center(
              child: Container(
                width: deviceWidth(context) * 0.12,
                color: Colors.grey[50],
                child: const Text(
                  'OR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: deviceHeight(context) * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: deviceWidth(context) * 0.07,
                right: deviceWidth(context) * 0.09,
              ),
              child: SizedBox(
                height: deviceHeight(context) * 0.065,
                width: deviceWidth(context) * double.infinity,
                child: TextButton(
                  child: const Text(
                    'Continue with google',
                    style: TextStyle(
                      color: Color(0xff0D638A),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xff0D638A),
                      ),
                    )),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Sign in with google'),
                        content: RaisedButton(
                          child: const Text(
                            'Okay',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: const Color(0xff0D638A),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight(context) * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: deviceWidth(context) * 0.07,
                right: deviceWidth(context) * 0.09,
              ),
              child: SizedBox(
                height: deviceHeight(context) * 0.065,
                width: deviceWidth(context) * double.infinity,
                child: TextButton(
                  child: const Text(
                    'Continue with facebook',
                    style: TextStyle(
                      color: Color(0xff0D638A),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xff0D638A),
                      ),
                    )),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Sign in with facebook'),
                        content: RaisedButton(
                          child: const Text(
                            'Okay',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: const Color(0xff0D638A),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
