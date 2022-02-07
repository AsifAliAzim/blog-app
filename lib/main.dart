import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/authentication_screen.dart';
import './screens/sign_in_screen.dart';
import './screens/screen_one.dart';
import './screens/new_blogs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasError) {
            print(userSnapshot.error);
          }
          if (userSnapshot.hasData) {
            ScreenOne();
          }
          return AuthenticationScreen();
        },
      ),
      routes: {
        AuthenticationScreen.routeName: (ctx) => AuthenticationScreen(),
        SigninScreen.routeName: (ctx) => SigninScreen(),
        ScreenOne.routeName: (ctx) => ScreenOne(),
        NewBlogScrren.routeName: (ctx) => NewBlogScrren(),
      },
    );
  }
}
