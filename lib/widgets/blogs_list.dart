import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../screens/blog_detail_screen.dart';

class Blogs extends StatefulWidget {
  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  String? title;
  String? description;
  String? image;
  String? date;
  var firestoreDB = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreDB,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return SizedBox();
        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            top: 0.0,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => Column(
            children: [
              Slidable(
                key: ValueKey(DateTime.now().toIso8601String()),
                endActionPane: const ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xffE12F2F),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xff10B537),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text("  ${snapshot.data!.docs[index]['date']}"),
                  subtitle: Container(
                    height: deviceHeight(context) * 0.18,
                    child: GridTileBar(
                      leading: Container(
                        width: deviceWidth(context) * 0.844,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              GestureDetector(
                                child: Image.network(
                                  snapshot.data!.docs[index]['imageUrl'],
                                  fit: BoxFit.fill,
                                  width: deviceWidth(context) * 0.842,
                                ),
                                onTap: () {
                                  date = snapshot.data!.docs[index]['date'];
                                  title =
                                      snapshot.data!.docs[index]['blogTitle'];
                                  description =
                                      snapshot.data!.docs[index]['blogText'];
                                  image =
                                      snapshot.data!.docs[index]['imageUrl'];

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlogDetailScreen(
                                        date!,
                                        title!,
                                        description!,
                                        image!,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: deviceHeight(context) * 0.05,
                                    color: Colors.black26.withOpacity(0.36),
                                    child: Row(
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left:
                                                  deviceHeight(context) * 0.01,
                                            ),
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  ['blogTitle'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: deviceWidth(context) * 0.05,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title: const Text('Sharing'),
                                                  content: RaisedButton(
                                                    child: const Text(
                                                      'Okay',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    color:
                                                        const Color(0xff0D638A),
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop();
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                            child: const Icon(
                                              Icons.share,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight(context) * 0.02,
              )
            ],
          ),
        );
      },
    );
  }
}
