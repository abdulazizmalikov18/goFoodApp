import 'package:firebase_auth/firebase_auth.dart';
import 'package:snov/models/user.dart';
import 'package:snov/services/database.dart';

class AuthService {
  final FirebaseAuth _authUser = FirebaseAuth.instance;

  Foydalanuvchi _firebasedanKelganFoydalanuvchi(User? user) {
    return Foydalanuvchi(uid: user!.uid);
  }

  Future signInAnonymousFunksiyasi() async {
    try {
      UserCredential _credential = await _authUser.signInAnonymously();
      User user = _credential.user!;
      print("FIREBASE USER ID: " + user.uid);
      return _firebasedanKelganFoydalanuvchi(user);
    } catch (e) {
      print("XATO AUTH_SERVICE: ${e}");
      return null;
    }
  }

  Stream<Foydalanuvchi> get user {
    return _authUser.authStateChanges().map(_firebasedanKelganFoydalanuvchi);
  }

  Future signOut() async {
    try {
      return await _authUser.signOut();
    } catch (e) {
      print("AUTH SERVICE SIGN OUT: $e");
    }
  }

  Future signUpWithEmailFunksiyasi(
      String email, String password, String name) async {
    try {
      UserCredential _credential = await _authUser
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = _credential.user!;

      await DatabaseService(uid: user.uid).malumotUpdate(
        ism: email,
        buyurtma:[],
        name:name,
        like:[],
        buyurtmaSoni:0,
        number:'+0000000000000',
        izoh:'Null',
        id:user.uid,
        image:"https://firebasestorage.googleapis.com/v0/b/coffeapp-f3bf3.appspot.com/o/najot.jpg?alt=media&token=a8b13960-8ec4-43cc-9a9b-e29926def23b",
      );

      return _firebasedanKelganFoydalanuvchi(user);
    } catch (e) {
      print("XATO AUTH SERVICE SIGN UP: $e");
    }
  }
  Future profilUpdate(String name, String izoh, String number)async{
    try {
      User user = _authUser.currentUser!;
      await DatabaseService(uid: user.uid).profilUpdate(
        name: name,
        izoh: izoh,
        number: number,
      );
    } catch (e) {
    }
  }

  Future signInWithEmailFunksiyasi(String email, String password) async {
    try {
      UserCredential _credential = await _authUser.signInWithEmailAndPassword(
          email: email, password: password);
      User user = _credential.user!;
      return _firebasedanKelganFoydalanuvchi(user);
    } catch (e) {
      print("XATO AUTH SERVICE SIGN IN: $e");
    }
  }

  FoydalanuvchiData _snapshotdanKelganUserDatasi(snap) {
    return FoydalanuvchiData(
      uid: _authUser.currentUser!.uid,
    );
  }
}
