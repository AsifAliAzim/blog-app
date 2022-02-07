import 'package:flutter/material.dart';

import '../widgets/new_blog_screen_header.dart';
import '../widgets/new_blog_form.dart';

class NewBlogScrren extends StatelessWidget {
  static const routeName = '/new-blogs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          NewBlogScreenHeader(),
          NewBlogForm(),
        ],
      ),
    );
  }
}
