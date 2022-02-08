import 'package:flutter/material.dart';
import 'package:jmm_task/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/login_password_form.dart';
import '../widgets/google_facebook_buttons.dart';
import '../customization/remove_scroll_glow.dart';

class AuthenticationScreen extends StatefulWidget {
  static const routeName = '/auth-screen';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  Future<void> _submitLoginForm(
    String email,
    String password,
    BuildContext ctx,
  ) async {
    //AuthResule.......UserCredential
    UserCredential authResult;
    // UserCredential userCredential;

    try {
      authResult = (await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ));
    } on FirebaseAuthException catch (err) {
      var message = 'An error occurred, please check your credentials.';

      if (err.message != null) {
        message = err.message!;
      }
      Scaffold.of(ctx).showSnackBar(
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
      Scaffold.of(ctx).showSnackBar(
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
              padding: EdgeInsets.only(
                top: deviceHeight(context) * 0.1,
                bottom: deviceHeight(context) * 0.08,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/01.png',
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: deviceWidth(context) * 0.07,
              ),
              child: const Text(
                'Login',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
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
                  fontSize: 18,
                ),
              ),
            ),
            LoginPasswordForm(
              _submitLoginForm,
              _isLoading,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.04,
            ),
            GoogleFacebookButtons(),
            SizedBox(
              height: deviceHeight(context) * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: deviceWidth(context) * 0.09,
              ),
              child: Row(
                children: [
                  const Text('Don\'t have an account? '),
                  FlatButton(
                    padding: const EdgeInsets.all(0.0),
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                        color: Color(0xff0D638A),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(SigninScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: deviceHeight(context) * 0.03,
            ),
          ],
        ),
      ),
    ));
  }
}
