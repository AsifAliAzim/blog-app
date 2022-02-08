import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import '../customization/remove_scroll_glow.dart';

class NewBlogForm extends StatefulWidget {
  @override
  _NewBlogFormState createState() => _NewBlogFormState();
}

class _NewBlogFormState extends State<NewBlogForm> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  XFile? imagePick;
  String? firebaseImagePath;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _blogTitle = TextEditingController();
  final TextEditingController _blogText = TextEditingController();

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(now);

  @override
  Widget build(BuildContext context) {
    final placeholderImage = buildImage('assets/images/Component 10 – 1.png');
    return Container(
      height: deviceHeight(context) - 149.9,
      child: Form(
        key: _formKey,
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
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(deviceHeight(context) * 0.01),
                  child: Container(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        imagePick == null
                            ? placeholderImage
                            : Image.file(
                                File(
                                  imagePick!.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                        Center(
                          child: imagePick == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/Icon metro-file-upload.png',
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: ((builder) => bottomSheet()),
                                        );
                                      },
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
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                    width: deviceWidth(context),
                    height: deviceHeight(context) * 0.2,
                  ),
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
                  controller: _blogTitle,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your blog title';
                    }
                    return null;
                  },
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
                controller: _blogText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Blog can\'t be empty please type your blog.';
                  }
                  return null;
                },
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
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // print('validated');
                          // print('${_blogTitle.text}');
                          // print('${_blogText.text}');
                          createUser(title: _blogTitle, blogText: _blogText);
                        }
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

  Widget bottomSheet() {
    return Container(
      height: deviceHeight(context) * 0.12,
      width: deviceWidth(context),
      margin: EdgeInsets.symmetric(
        horizontal: deviceWidth(context) * 0.05,
        vertical: deviceHeight(context) * 0.02,
      ),
      child: Column(
        children: [
          const Text(
            'Choose a header image',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff0D638A),
            ),
          ),
          SizedBox(
            height: deviceHeight(context) * 0.020,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // FlatButton.icon(
              //   onPressed: () {
              //     takeImage(ImageSource.camera);
              //   },
              //   icon: const Icon(
              //     Icons.camera,
              //     color: Color(0xff0D638A),
              //   ),
              //   label: const Text(
              //     'Camera',
              //     style: TextStyle(
              //       color: Color(0xff474747),
              //     ),
              //   ),
              // ),
              FlatButton.icon(
                onPressed: () {
                  takeImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.image,
                  color: Color(0xff0D638A),
                  size: deviceHeight(context) * 0.05,
                ),
                label: Text(
                  'Gallery',
                  style: TextStyle(
                    color: Color(0xff474747),
                    fontSize: deviceHeight(context) * 0.022,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takeImage(ImageSource source) async {
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePick = pickedImage;
      });
    }
    // final imagePick = await _picker.getImage(
    //   source: source,
    // );
    // setState(() {
    //   _imageFile = pickedFile!;
    // });
  }

  Future createUser(
      {required TextEditingController title,
      required TextEditingController blogText}) async {
    //Reference to ocument
    await uploadImage(
      imageName: imagePick!.name,
      imagePath: imagePick!.path,
    );
    // print('block Image.....${blockImage}');
    final docUser =
        FirebaseFirestore.instance.collection('users').doc('${DateTime.now()}');

    final json = {
      'blogTitle': title.text,
      'blogText': blogText.text,
      'imageUrl': firebaseImagePath,
      'date': formatted,
    };

    //Create document and write data to firebase

    Scaffold.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Your blog is added successfully!',
        style: TextStyle(fontSize: 16),
      ),
      backgroundColor: Color(0xff0D638A),
    ));
    await docUser.set(json);
    Navigator.of(context).pop();
  }

  Future uploadImage(
      {required String imageName, required String imagePath}) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final refrence = storage.ref().child('patientImages').child(imageName);

    UploadTask uploadTask = refrence.putFile(File(imagePath));

    // print('user image url ======== ${uploadTask.storage.bucket}');
    final tasksnapshot = await uploadTask.whenComplete(() async {
      final imageurl = await storage
          .ref()
          .child('patientImages')
          .child(imageName)
          .getDownloadURL();

      // print('image url...........$imageurl');

      // return imageurl;
      firebaseImagePath = imageurl;
    });
  }
}
