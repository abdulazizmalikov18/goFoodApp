import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import 'package:snov/Screens/HomeScreen.dart';
import 'package:snov/Screens/historyScreen.dart';
import 'package:snov/Screens/kirishScreen.dart';
import 'package:snov/Screens/login/wrapp.dart';
import 'package:snov/Screens/lovescreen.dart';
import 'package:snov/Screens/myProfilScreen.dart';
import 'package:snov/models/user.dart';
import 'package:snov/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Foydalanuvchi>.value(
      initialData: Foydalanuvchi(),
      catchError: (_, __) => ErrorFoydalanuvchi().a(),
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFFA4A0C),
          iconTheme: IconThemeData(color: Colors.black),
          primarySwatch: Colors.orange,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey[220],
          ),
        ),
        home: Wrapper(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  ZoomDrawerController? zoomDrawerController;
  MyHomePage({this.zoomDrawerController});


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  Color bottomMenuColor = Colors.transparent;
  List<Widget>? pageList;
  HomeScreen? homeScreen;
  LoveScreen? lovescreen;
  HistoryScreen? historyScreen;
  MyProfilScreen? myProfilScreen;
  var homeScreenKey = PageStorageKey("home_key");
  var lovescreenKay = PageStorageKey("love_key");
  var historyScreenKey = PageStorageKey("history_key");
  var myProfilScreenKey = PageStorageKey("profil_key");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreen = HomeScreen(key: homeScreenKey,zoomDrawerController: widget.zoomDrawerController);
    lovescreen = LoveScreen(key: lovescreenKay);
    historyScreen = HistoryScreen(key: historyScreenKey);
    myProfilScreen = MyProfilScreen(key: myProfilScreenKey);
    pageList = [
      homeScreen!,
      lovescreen!,
      historyScreen!,
      myProfilScreen!,
    ];
  }

  final _kBottmonNavBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[220],
      body: pageList![selectedIndex],
      bottomNavigationBar: bottomMenu(),
    );
  }

  Widget bottomMenu() {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.grey[220],
      items: _kBottmonNavBarItems,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (selectedIndexMenu) {
        setState(() {
          selectedIndex = selectedIndexMenu;
        });
      },
    );
  }
}
