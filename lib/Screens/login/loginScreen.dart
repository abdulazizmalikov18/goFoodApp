import 'package:flutter/material.dart';
import 'package:snov/Screens/login/login.dart';
import 'package:snov/Screens/login/signUp.dart';
import 'package:snov/const/consts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  TabController? tabController1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: kbottomColor,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: korqafon,
            ),
            height: size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 150,
                  child: Image.asset("assets/oshpaz.png"),
                ),
                SizedBox(height: size.height* 0.03,),
                Container(
                  color: korqafon,
                  child: tabBar(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: kbottomColor,
              child: tabBarView(),
            ),
          ),
        ],
      ),
    );
  }

  TabBar tabBar() {
    return TabBar(
      isScrollable: true,
      controller: tabController1,
      indicatorColor: ktextBottom,
      indicatorWeight: 2.0,
      unselectedLabelStyle: TextStyle(color: Colors.grey[200]),
      tabs: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          padding: EdgeInsets.only(bottom: 10),
          child: Tab(
            child: Text(
              "Login",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          padding: EdgeInsets.only(bottom: 10),
          child: Tab(
            child: Text(
              "Sign-up",
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }

  TabBarView tabBarView() {
    return TabBarView(
      controller: tabController1,
      children: [
        Login(),
        SignUpe(),
      ],
    );
  }
}
