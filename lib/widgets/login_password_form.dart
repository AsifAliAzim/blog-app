import 'package:flutter/material.dart';
import 'package:jmm_task/screens/screen_one.dart';
import 'package:jmm_task/screens/sign_in_screen.dart';

import '../helper/authentication_helper.dart';

class LoginPasswordForm extends StatefulWidget {
  LoginPasswordForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;

  final void Function(
    String email,
    String password,
    BuildContext ctx,
  ) submitFn;
  @override
  _LoginPasswordFormState createState() => _LoginPasswordFormState();
}

class _LoginPasswordFormState extends State<LoginPasswordForm> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  final useremail = TextEditingController();
  final userpassword = TextEditingController();

  bool _secureText = true;

  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userPassword = '';

  void _Login() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context)
        .unfocus(); //this will close the keyboard which might be open as soon as form is submitted

    if (isValid) {
      _formKey.currentState!.save();

      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        context,
      );
      print(_userEmail);
      print(_userPassword);
      //can sent our authentication request to firebase here
    }
  }

  @override
  void dispose() {
    super.dispose();
    useremail.dispose();
    userpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: deviceWidth(context) * 0.07,
          right: deviceWidth(context) * 0.09,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            top: deviceHeight(context) * 0.04,
          ),
          shrinkWrap: true,
          children: [
            const Text(
              'Email',
            ),
            SizedBox(
              height: deviceHeight(context) * 0.018,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.065,
              child: TextFormField(
                controller: useremail,
                validator: (value) {
                  if (value!.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.com')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'xyz@gmail.com',
                  labelStyle: const TextStyle(
                    fontSize: 24,
                    color: Color(0xff0D638A),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  _userEmail = value!;
                },
              ),
            ),
            SizedBox(
              height: deviceHeight(context) * 0.03,
            ),
            const Text(
              'Password',
            ),
            SizedBox(
              height: deviceHeight(context) * 0.01,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.065,
              child: TextFormField(
                controller: userpassword,
                validator: (value) {
                  if (value!.isEmpty || value.length < 7) {
                    return 'Password must be atleast seven characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  labelStyle: const TextStyle(
                    fontSize: 24,
                    color: Color(0xff0D638A),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _secureText = !_secureText;
                      });
                    },
                  ),
                ),
                obscureText: _secureText,
                keyboardType: TextInputType.visiblePassword,
                onSaved: (value) {
                  _userPassword = value!;
                },
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: deviceWidth(context) * 0.53,
                ),
                RaisedButton(
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xff0D638A),
                    ),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  elevation: 0.0,
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Password Recovery'),
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
              ],
            ),
            SizedBox(
              height: deviceHeight(context) * 0.02,
            ),
            // if (widget.isLoading) CircularProgressIndicator(),
            // if (!widget.isLoading)
            SizedBox(
              height: deviceHeight(context) * 0.065,
              child: GestureDetector(
                onTap: () {
                  _userEmail = useremail.text.toString();
                  _userPassword = userpassword.text.toString();
                  AuthenticationHelper()
                      .signIn(
                          email: _userEmail.trim(),
                          password: _userPassword.trim())
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => ScreenOne()));
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                        backgroundColor: const Color(0xff0D638A),
                      ));
                    }
                  });
                },
                child: Container(
                  child: const Center(
                    child: Text(
                      'Sign In',
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
          ],
        ),
      ),
    );
  }
}
