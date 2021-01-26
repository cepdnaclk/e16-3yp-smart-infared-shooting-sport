import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtag_demo/Model/player.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  //collection refferances
  final CollectionReference playerCollection =
      FirebaseFirestore.instance.collection("player");

  Future updateUserData(
    String email,
    String name,
    int battleswon,
    int battlesplayed,
    int kills,
    int deaths,
  ) async {
    print(uid);
    return await playerCollection.doc(uid).set({
      'email': email,
      'name': name,
      'Battles Won': battleswon,
      'Battles Played': battlesplayed,
      'Total Kills': kills,
      'Total Deaths': deaths
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
