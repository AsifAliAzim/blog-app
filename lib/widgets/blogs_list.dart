import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/data.dart';
import '../customization/remove_scroll_glow.dart';
import '../screens/blog_detail_screen.dart';

class Blogs extends StatefulWidget {
  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Photography Tips',
      description:
          'The things that surround us in our everyday lives and environments have a way of being utterly banal–of fading into background, becoming simply part of the mosaic of our daily routines. In a state like Ohio, which historically was depopulated of its Indigenous nations through processes of land theft and dispossession, the presence of Indigenous related place names and mascots represent such a marriage of the banal and the Indigenous. Names like “Hopewell”, “Moundbuilders”, and teams like the recently renamed Cleveland Indians are representations of Indigeneity that we’ve taken to be a part of the everyday geographical and cultural fabric of this state. But if we take a closer look, we can  learn much about the undercurrents of Indigenous identity and geographies that still exist in Ohio, as well as the fraught nature of how Indigenous identity has been presented (and in many cases, co-opted) in the state. In this photo essay, William Sharp, a recent alumni of The Ohio State University, explores how Indigenous histories can peek out from behind the banal. The images, which Sharp was led to by Indigenous scholars and experts, range across the state from Newark to Cleveland to Toledo to Chillicothe, from places as bustling and energetic as Progressive Field to the quiet solitude of wetlands in northwestern Ohio. Sharp brings the viewer through the landscapes of daily life in Ohio, with an eye toward uncovering the Indigenous presence that still endures upon the land. Cover image: Railways leading to the heart of Cleveland, Ohio from the Hope Memorial Bridge. Erie, Seneca, and Delaware people have all called Cleveland home. Cleveland became an urban hub of Indigenous Activism with the founding of the Cleveland American Indian Center Center and the Cleveland Chapter of AIM. William Sharp is an artist, photographer, and archivist living and building community in Ohio, on land belonging to Shawnee, Potawatomi, Delaware, Miami, Peoria, Seneca, Wyandotte, Ojibwe, and Cherokee peoples.',
      price: 29.99,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/chat-application-71218.appspot.com/o/1462428_639f_8.png?alt=media&token=8bf17e87-8af7-4689-b41d-6c18d08a5cb5',
    ),
    Product(
      id: 'p2',
      title: 'Self learning',
      description:
          'The world of self-learning can be a little daunting. However, if we want to achieve our aspirations and stay relevant in an ever-changing world, self-learning is critical to us in the 21st Century. Here are reasons why I believe this and I’ve included 5 ways we can all nurture a greater sense of self-learning in ourselves. Research reported by Harvard Business Review also reveals that we ‘rarely grow alone’ and that we are better equipped to learn and extend our knowledge as a collective. This is powering the growth of like-minded networks, especially within organisations and teams. However, as we seek more meaningful pursuits in our lives, the ability to learn for ourselves extends far past simply the workplace. In an economy and society that innovates faster than ever in human history, challenges also crop up that require just as swift resolution. Facing a future that we cannot foresee, the ability to adapt and learn is key. However, where there are gaps in knowledge, fear can fill the void and cause procrastination, denial and ignorance. Technology and the connectivity of people, is the only way to equip ourselves with the mobility we need to combat this unknown future.',
      price: 59.99,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/chat-application-71218.appspot.com/o/wes-hicks-4-EeTnaC1S4-unsplash%403x.png?alt=media&token=d3796e85-5e16-44b2-9285-d635d9b80035',
    ),
    Product(
      id: 'p3',
      title: 'Node JS Cource',
      description:
          'As an asynchronous event-driven JavaScript runtime, Node.js is designed to build scalable network applications. In the following "hello world" example, many connections can be handled concurrently. Upon each connection, the callback is fired, but if there is no work to be done, Node.js will sleep. This is in contrast to today\'s more common concurrency model, in which OS threads are employed. Thread-based networking is relatively inefficient and very difficult to use. Furthermore, users of Node.js are free from worries of dead-locking the process, since there are no locks. Almost no function in Node.js directly performs I/O, so the process never blocks except when the I/O is performed using synchronous methods of Node.js standard library. Because nothing blocks, scalable systems are very reasonable to develop in Node.js. Node.js is similar in design to, and influenced by, systems like Ruby\'s Event Machine and Python\'s Twisted. Node.js takes the event model a bit further. It presents an event loop as a runtime construct instead of as a library. In other systems, there is always a blocking call to start the event-loop. Typically, behavior is defined through callbacks at the beginning of a script, and at the end a server is started through a blocking call like EventMachine::run(). In Node.js, there is no such start-the-event-loop call. Node.js simply enters the event loop after executing the input script. Node.js exits the event loop when there are no more callbacks to perform. This behavior is like browser JavaScript — the event loop is hidden from the user.',
      price: 19.99,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/chat-application-71218.appspot.com/o/1565838_e54e_15.png?alt=media&token=2f38216f-9353-405d-8bbe-fbb476b3e0f0',
    ),
    Product(
      id: 'p4',
      title: 'HBL Banking',
      description:
          'Habib Bank Limited (Urdu: حبیب بینک) abbreviated as HBL, is a Pakistani multinational bank based in Habib Bank Plaza, Karachi, Pakistan. Founded in 1940 by the Habib Family, HBL became Pakistan\'s first commercial bank. In 1951 it opened its first international branch in Colombo, Sri Lanka. In 1972 the bank moved its headquarters to the Habib Bank Plaza, which became the tallest building in South Asia at the time. The Government nationalized the bank in 1974 and privatized it in 2003; at that time the Aga Khan Fund for Economic Development acquired a controlling share. HBL major shareholding lies with the Aga Khan Fund for Economic Development (AKFED) which is based in Geneva, Switzerland. As of 2018, HBL has 1700+ branches with presence in over 25 countries spanning across four continents. It is the largest company in Pakistan in terms of assets, and has repeatedly ranked top Pakistani company in the Forbes Global 2000.[5][6] It is also Pakistan’s largest commercial bank, with over 1,700 branches.[7]',
      price: 49.99,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/chat-application-71218.appspot.com/o/istockphoto-1270067126-612x612%403x.png?alt=media&token=5bac2e65-b916-471e-bcb0-d65e47a0b8c7',
    ),
    Product(
        id: 'p5',
        title: 'DHL',
        description:
            'The things that surround us in our everyday lives and environments have a way of being utterly banal–of fading into background, becoming simply part of the mosaic of our daily routines. In a state like Ohio, which historically was depopulated of its Indigenous nations through processes of land theft and dispossession, the presence of Indigenous related place names and mascots represent such a marriage of the banal and the Indigenous. Names like “Hopewell”, “Moundbuilders”, and teams like the recently renamed Cleveland Indians are representations of Indigeneity that we’ve taken to be a part of the everyday geographical and cultural fabric of this state. But if we take a closer look, we can  learn much about the undercurrents of Indigenous identity and geographies that still exist in Ohio, as well as the fraught nature of how Indigenous identity has been presented (and in many cases, co-opted) in the state. In this photo essay, William Sharp, a recent alumni of The Ohio State University, explores how Indigenous histories can peek out from behind the banal. The images, which Sharp was led to by Indigenous scholars and experts, range across the state from Newark to Cleveland to Toledo to Chillicothe, from places as bustling and energetic as Progressive Field to the quiet solitude of wetlands in northwestern Ohio. Sharp brings the viewer through the landscapes of daily life in Ohio, with an eye toward uncovering the Indigenous presence that still endures upon the land. Cover image: Railways leading to the heart of Cleveland, Ohio from the Hope Memorial Bridge. Erie, Seneca, and Delaware people have all called Cleveland home. Cleveland became an urban hub of Indigenous Activism with the founding of the Cleveland American Indian Center Center and the Cleveland Chapter of AIM. William Sharp is an artist, photographer, and archivist living and building community in Ohio, on land belonging to Shawnee, Potawatomi, Delaware, Miami, Peoria, Seneca, Wyandotte, Ojibwe, and Cherokee peoples.',
        price: 29.99,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/chat-application-71218.appspot.com/o/alex-mecl-44al1GlFVxo-unsplash%403x.png?alt=media&token=a7e16f47-d76c-4c54-9968-06e628e13ca9'),
    Product(
      id: 'p6',
      title: 'Turkay Mosques',
      description:
          'The things that surround us in our everyday lives and environments have a way of being utterly banal–of fading into background, becoming simply part of the mosaic of our daily routines. In a state like Ohio, which historically was depopulated of its Indigenous nations through processes of land theft and dispossession, the presence of Indigenous related place names and mascots represent such a marriage of the banal and the Indigenous. Names like “Hopewell”, “Moundbuilders”, and teams like the recently renamed Cleveland Indians are representations of Indigeneity that we’ve taken to be a part of the everyday geographical and cultural fabric of this state. But if we take a closer look, we can  learn much about the undercurrents of Indigenous identity and geographies that still exist in Ohio, as well as the fraught nature of how Indigenous identity has been presented (and in many cases, co-opted) in the state. In this photo essay, William Sharp, a recent alumni of The Ohio State University, explores how Indigenous histories can peek out from behind the banal. The images, which Sharp was led to by Indigenous scholars and experts, range across the state from Newark to Cleveland to Toledo to Chillicothe, from places as bustling and energetic as Progressive Field to the quiet solitude of wetlands in northwestern Ohio. Sharp brings the viewer through the landscapes of daily life in Ohio, with an eye toward uncovering the Indigenous presence that still endures upon the land. Cover image: Railways leading to the heart of Cleveland, Ohio from the Hope Memorial Bridge. Erie, Seneca, and Delaware people have all called Cleveland home. Cleveland became an urban hub of Indigenous Activism with the founding of the Cleveland American Indian Center Center and the Cleveland Chapter of AIM. William Sharp is an artist, photographer, and archivist living and building community in Ohio, on land belonging to Shawnee, Potawatomi, Delaware, Miami, Peoria, Seneca, Wyandotte, Ojibwe, and Cherokee peoples.',
      price: 50.99,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/chat-application-71218.appspot.com/o/artur-aldyrkhanov-RnyZVY9KDNE-unsplash%403x.png?alt=media&token=23f780c9-1276-4f22-8186-442947589dd8',
    ),
    Product(
      id: 'p9',
      title: 'Science',
      description:
          'The things that surround us in our everyday lives and environments have a way of being utterly banal–of fading into background, becoming simply part of the mosaic of our daily routines. In a state like Ohio, which historically was depopulated of its Indigenous nations through processes of land theft and dispossession, the presence of Indigenous related place names and mascots represent such a marriage of the banal and the Indigenous. Names like “Hopewell”, “Moundbuilders”, and teams like the recently renamed Cleveland Indians are representations of Indigeneity that we’ve taken to be a part of the everyday geographical and cultural fabric of this state. But if we take a closer look, we can  learn much about the undercurrents of Indigenous identity and geographies that still exist in Ohio, as well as the fraught nature of how Indigenous identity has been presented (and in many cases, co-opted) in the state. In this photo essay, William Sharp, a recent alumni of The Ohio State University, explores how Indigenous histories can peek out from behind the banal. The images, which Sharp was led to by Indigenous scholars and experts, range across the state from Newark to Cleveland to Toledo to Chillicothe, from places as bustling and energetic as Progressive Field to the quiet solitude of wetlands in northwestern Ohio. Sharp brings the viewer through the landscapes of daily life in Ohio, with an eye toward uncovering the Indigenous presence that still endures upon the land. Cover image: Railways leading to the heart of Cleveland, Ohio from the Hope Memorial Bridge. Erie, Seneca, and Delaware people have all called Cleveland home. Cleveland became an urban hub of Indigenous Activism with the founding of the Cleveland American Indian Center Center and the Cleveland Chapter of AIM. William Sharp is an artist, photographer, and archivist living and building community in Ohio, on land belonging to Shawnee, Potawatomi, Delaware, Miami, Peoria, Seneca, Wyandotte, Ojibwe, and Cherokee peoples.',
      price: 80.99,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/chat-application-71218.appspot.com/o/1754098_e0df_3.png?alt=media&token=fb33ef73-4da8-4df7-a08d-f629e4283583',
    ),
    Product(
      id: 'p11',
      title: 'A first',
      description:
          'The things that surround us in our everyday lives and environments have a way of being utterly banal–of fading into background, becoming simply part of the mosaic of our daily routines. In a state like Ohio, which historically was depopulated of its Indigenous nations through processes of land theft and dispossession, the presence of Indigenous related place names and mascots represent such a marriage of the banal and the Indigenous. Names like “Hopewell”, “Moundbuilders”, and teams like the recently renamed Cleveland Indians are representations of Indigeneity that we’ve taken to be a part of the everyday geographical and cultural fabric of this state. But if we take a closer look, we can  learn much about the undercurrents of Indigenous identity and geographies that still exist in Ohio, as well as the fraught nature of how Indigenous identity has been presented (and in many cases, co-opted) in the state. In this photo essay, William Sharp, a recent alumni of The Ohio State University, explores how Indigenous histories can peek out from behind the banal. The images, which Sharp was led to by Indigenous scholars and experts, range across the state from Newark to Cleveland to Toledo to Chillicothe, from places as bustling and energetic as Progressive Field to the quiet solitude of wetlands in northwestern Ohio. Sharp brings the viewer through the landscapes of daily life in Ohio, with an eye toward uncovering the Indigenous presence that still endures upon the land. Cover image: Railways leading to the heart of Cleveland, Ohio from the Hope Memorial Bridge. Erie, Seneca, and Delaware people have all called Cleveland home. Cleveland became an urban hub of Indigenous Activism with the founding of the Cleveland American Indian Center Center and the Cleveland Chapter of AIM. William Sharp is an artist, photographer, and archivist living and building community in Ohio, on land belonging to Shawnee, Potawatomi, Delaware, Miami, Peoria, Seneca, Wyandotte, Ojibwe, and Cherokee peoples.',
      price: 95.99,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/chat-application-71218.appspot.com/o/keenan-beasley--kIMLYD97sc-unsplash%402x.png?alt=media&token=030a7dc3-47e9-4a51-b030-fe400353bf63',
    ),
  ];

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  final date = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context) * 0.7385,
      width: deviceWidth(context),
      //color: Colors.grey,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: 0.0,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) => Column(
            children: [
              Slidable(
                key: ValueKey(_items[index].id),
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
                  title: Text('  Post date: ${date.format(DateTime.now())}'),
                  subtitle: Container(
                    height: deviceHeight(context) * 0.18,
                    child: GridTileBar(
                      leading: Container(
                        width: deviceWidth(context) * 0.844,
                        // color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              GestureDetector(
                                child: Image.network(
                                  _items[index].imageUrl,
                                  fit: BoxFit.fill,
                                  width: deviceWidth(context) * 0.842,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlogDetailScreen(
                                        date,
                                        _items[index].title,
                                        _items[index].description,
                                        _items[index].imageUrl,
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
                                    color: Colors.black12,
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
                                              '${_items[index].title}',
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
        ),
      ),
    );
  }
}
