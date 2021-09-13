import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:snov/Screens/malumot.dart';
import 'package:snov/Screens/profilhelp/card.dart';
import 'package:snov/Screens/profilhelp/searchPagew.dart';
import 'package:snov/Widgets/DishContainer.dart';
import 'package:snov/const/consts.dart';

class HomeScreen extends StatefulWidget {
  ZoomDrawerController? zoomDrawerController;
  HomeScreen({this.zoomDrawerController, Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _authUser = FirebaseAuth.instance;
  int _index = 0;
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32,
                  child: TextButton(
                    onPressed: () async {
                      await widget.zoomDrawerController!.open!();
                      print('och');
                    },
                    child: Image(
                      image: AssetImage(
                        "assets/icon/Vector.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    },
                    child: Image(
                      image: AssetImage("assets/icon/shopping-cart.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 70,
                child: Text("Delicious \nfood for you",
                    style: TextStyle(fontSize: 28)),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Hero(
                tag: Container(),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                      color: kbottomColor,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.black87),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Colors.grey[28],
                    //     hintText: 'Search',
                    //     hintStyle:
                    //         TextStyle(color: Colors.grey[400], fontSize: 16),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //       borderSide: BorderSide(
                    //         width: 0,
                    //         style: BorderStyle.none,
                    //       ),
                    //     ),
                    //     prefixIcon: Icon(
                    //       Icons.search,
                    //       color: Colors.black87,
                    //       size: 30,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: DefaultTabController(
                length: 6,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: 'Foods',
                    ),
                    Tab(
                      text: "Drinks",
                    ),
                    Tab(
                      text: "Snacks",
                    ),
                    Tab(
                      text: "Sauche",
                    ),
                    Tab(
                      text: "Salads",
                    ),
                    Tab(
                      text: "Breakfast",
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Recommended',
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           'see more',
            //           style: TextStyle(
            //             fontSize: 15,
            //             color: Colors.orange,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: size.height * 0.42,
              child: StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection("Taomlar")
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return PageView.builder(
                        itemCount: snapshot.data.docs.length,
                        controller: PageController(viewportFraction: 0.6),
                        onPageChanged: (int? index) =>
                            setState(() => _index = index!),
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MalumotScreen(
                                    index: _index,
                                    i: i,
                                  ),
                                ),
                              );
                            },
                            child: DishContainer(
                              index: _index,
                              i: i,
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
            SizedBox(height: 20),
            // Container(
            //   width: 300,
            //   child: ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     itemCount: favouriteDishes.length,
            //     itemBuilder: (context, index1) {
            //       return FavouriteContainer(
            //         index: index1,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: DotNavigationBar(
      //   selectedItemColor: Colors.red,
      //   currentIndex: _selectedTab,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedTab = index;
      //     });
      //   },
      //   items: [
      //     DotNavigationBarItem(
      //       icon: Icon(
      //         Icons.home_outlined,
      //       ),
      //     ),
      //     DotNavigationBarItem(
      //       icon: Icon(
      //         Icons.fastfood,
      //       ),
      //     ),
      //     DotNavigationBarItem(
      //       icon: Icon(
      //         Icons.shopping_cart_outlined,
      //       ),
      //     ),
      //     DotNavigationBarItem(
      //       icon: Icon(
      //         Icons.person_outlined,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
