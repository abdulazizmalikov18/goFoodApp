import 'package:snov/Screens/HomeScreen.dart';
import 'package:snov/Screens/myProfilScreen.dart';
import 'package:snov/main.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<MyHomePage>(() => MyHomePage());
    register<HomeScreen>(() => HomeScreen());
    register<MyProfilScreen>(() => MyProfilScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}
