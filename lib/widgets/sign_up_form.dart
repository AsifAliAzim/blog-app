import 'package:flutter/material.dart';
import 'package:jmm_task/screens/authentication_screen.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm(
    this.submitFnn,
    this.isLoading,
  );

  final bool isLoading;

  final void Function(
    String username,
    String useremail,
    String userpassword,
    BuildContext ctxx,
  ) submitFnn;
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  bool _secureText = true;

  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  String _userEmail = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context)
        .unfocus(); //this will close the keyboard which might be open as soon as form is submitted

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFnn(
        _userName.trim(),
        _userEmail.trim(),
        _userPassword.trim(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: deviceWidth(context) * 0.07,
            right: deviceWidth(context) * 0.09,
            top: deviceHeight(context) * 0.04,
          ),
          children: [
            const Text(
              'Full name',
            ),
            SizedBox(
              height: deviceHeight(context) * 0.01,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.065,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Please enter atleast four characters long name.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'John Doe',
                  labelStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  _userName = value!;
                },
              ),
            ),
            SizedBox(
              height: deviceHeight(context) * 0.03,
            ),
            const Text(
              'Email',
            ),
            SizedBox(
              height: deviceHeight(context) * 0.01,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.065,
              child: TextFormField(
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
                    color: Colors.blue,
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
                validator: (value) {
                  if (value!.isEmpty || value.length < 7) {
                    return 'Password must be atleast seven characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: '*******************',
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
            SizedBox(
              height: deviceHeight(context) * 0.020,
            ),
            Row(
              children: [
                const Checkbox(
                  value: false,
                  onChanged: null,
                ),
                const Text(
                  'I Agree to the ',
                ),
                RaisedButton(
                  child: const Text(
                    'Terms and conditions',
                    style: TextStyle(
                      color: Color(0xff0D638A),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  elevation: 0.0,
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Terms and conditions'),
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
              child: InkWell(
                onTap: _trySubmit,
                child: Container(
                  child: const Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff0D638A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight(context) * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AuthenticationScreen.routeName);
                  },
                  child: Container(
                    child: const Text(
                      'Log in',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xff0D638A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
