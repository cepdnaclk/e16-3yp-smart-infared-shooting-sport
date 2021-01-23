import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtag_demo/Model/player.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  //collection refferances
  final CollectionReference playerCollection =
      FirebaseFirestore.instance.collection("player");

  Future updateUserData(
      String email, String name, String gunid, int battlesplayed) async {
    print(uid);
    return await playerCollection.doc(uid).set({
      'email': email,
      'name': name,
      'gunId': gunid,
      'Battles Played': battlesplayed,
    });
  }

  //players list
  List<Player> _playerListFromSnampshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Player(
          name: doc.data()['name'] ?? '',
          email: doc.data()['email'],
          battles: doc.data()['Battles Played']);
    }).toList();
  }

  //Get players Stream
  Stream<List<Player>> get players {
    return playerCollection.snapshots().map(_playerListFromSnampshot);
  }
}
