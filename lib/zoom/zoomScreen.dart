import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:snov/main.dart';
import 'package:snov/zoom/menuScreen.dart';

class Zooom extends StatefulWidget {
  @override
  _ZooomState createState() => _ZooomState();
}

class _ZooomState extends State<Zooom> {
  ZoomDrawerController? drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ZoomDrawer(
        style: DrawerStyle.DefaultStyle,
        mainScreenScale: 0.40,
        clipMainScreen: true,
        controller: drawerController,
        menuScreen: MenuScreen(),
        mainScreen: MyHomePage(zoomDrawerController: drawerController),
        borderRadius: 24.0,
        showShadow: true,
        angle: -20,
        backgroundColor: Colors.grey.shade300,
        slideWidth: MediaQuery.of(context).size.width * .5,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeInCirc,
      ),
    );
  }
}
