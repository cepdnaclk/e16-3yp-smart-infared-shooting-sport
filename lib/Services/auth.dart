import 'package:firebase_auth/firebase_auth.dart';
import 'package:xtag_demo/Model/user.dart';
import 'package:xtag_demo/Services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //crate user obj cased on firbaseuser
  UserN _userFromUser(User user) {
    return user != null ? UserN(uid: user.uid) : null;
  }

  //Stream<UserN> get onAuthStateChanged => _auth.onAuthStateChanged;
  //}
  Stream<UserN> get user {
    return _auth.authStateChanges().map((User user) => _userFromUser(user));
  }

  //sign in anonymisly
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print(result);
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Singup
  Future regWithEmailAndPassword(
      String email, String password, String userName) async {
    //if ()
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      //create new document for the user with the user ID
      await DatabaseServices(uid: user.uid)
          .updateUserData(email, userName, 0, 0, 0, 0);
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
