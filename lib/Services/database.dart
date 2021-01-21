import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  //collection refferances
  final CollectionReference playerCollection =
      FirebaseFirestore.instance.collection("player");

  Future updateUserData(String email, String name, int battlesplayed) async {
    print(uid);
    return await playerCollection.doc(uid).set({
      'email': email,
      'name': name,
      'Battles Played': battlesplayed,
    });
  }
}
