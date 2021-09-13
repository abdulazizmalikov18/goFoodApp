import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:snov/Screens/body.dart';
import 'package:snov/Screens/kirishScreen.dart';
import 'package:snov/main.dart';
import 'package:snov/models/user.dart';
import 'package:snov/zoom/zoomScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Foydalanuvchi>(context);

    print(user.uid);
    if (user.uid == null) {
      return Body();
    } else {
      return Zooom();
    }
  }
}
