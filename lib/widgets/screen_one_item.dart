import 'package:flutter/material.dart';

import '../screens/new_blogs_screen.dart';

class ScreenOneItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        // color: Colors.red,
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.upload_file_outlined,
                size: 40,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "You don't have any blogs",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NewBlogScrren.routeName);
                },
                child: Text(
                  "Lets's create a Blog",
                  style: TextStyle(
                    color: Colors.blue[900],
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 50,
              //     right: 50,
              //   ),
              //   child: Container(
              //     color: Colors.red,
              //     height: 300,
              //     child: Image.asset('assets/images/superman wall1.jpg'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
