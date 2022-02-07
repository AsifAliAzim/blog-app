import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/sign_up_form.dart';
import '../customization/remove_scroll_glow.dart';

class SigninScreen extends StatefulWidget {
  static const routeName = '/sign-in';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _authh = FirebaseAuth.instance;
  var _isLoading = false;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  Future<void> _submitSignUpForm(
    String username,
    String useremail,
    String userpassword,
    BuildContext ctxx,
  ) async {
    //AuthResule.......UserCredential
    UserCredential authResultt;
    try {
      setState(() {
        _isLoading = true;
      });
      authResultt = (await _authh.createUserWithEmailAndPassword(
        email: useremail,
        password: userpassword,
      ));

      //Firebase.instance.......FirebaseFirestore.instance
      //.document..........docs()
      //setData()...........set()
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResultt.user!.uid)
          .set({
        'username': username,
        'email': useremail,
      });
    } on PlatformException catch (err) {
      var message = 'An error occurred, please check your credentials.';

      if (err.message != null) {
        message = err.message!;
      }
      Scaffold.of(ctxx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      Scaffold.of(ctxx).showSnackBar(
        SnackBar(
          content: Text('$error'),
          backgroundColor: Color(0xff0D638A),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: deviceHeight(context) * 0.18,
              child: Column(
                children: [
                  SizedBox(
                    height: deviceHeight(context) * 0.12,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: deviceHeight(context) * 0.02,
                            ),
                            const Icon(
                              Icons.circle,
                              size: 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: deviceWidth(context) * 0.005,
                        ),
                        const Text(
                          'blog',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: deviceWidth(context) * 0.07,
                top: deviceHeight(context) * 0.03,
              ),
              child: const Text(
                'Create Account',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: deviceWidth(context) * 0.07,
              ),
              child: const Text(
                'Enter your credentials to login',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            SignUpForm(
              _submitSignUpForm,
              _isLoading,
            ),
          ],
        ),
      ),
    ));
  }
}
