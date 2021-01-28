import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtag_demo/Model/player.dart';
//import 'package:xtag_demo/Model/match.dart';

class DatabaseServices {
  final String uid;
  //final String matchid;
  DatabaseServices({this.uid});

  //final String matchid,
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
    String rank,
  ) async {
    print(uid);
    return await playerCollection.doc(uid).set({
      'email': email,
      'name': name,
      'Battles Won': battleswon,
      'Battles Played': battlesplayed,
      'Total Kills': kills,
      'Total Deaths': deaths,
      'rank': rank
    });
  }

  //match collection

  final CollectionReference matchCollection =
      FirebaseFirestore.instance.collection("match");

  final CollectionReference gameplayersCollection =
      FirebaseFirestore.instance.collection("players");
  //update the match bsic
  Future updateMatchMode(
    String mode,
    bool status,
    bool host,
    bool isStart,
    int duration,
  ) async {
    print(uid);
    String mid = matchCollection.doc().id;
    //print(mid);
    await matchCollection.doc(mid).set({
      'mode': mode,
      'status': status,
      'host': host,
      'isStart': isStart,
      'duration': duration
    });
    return mid;
  }

  //set match time
  Future updateMatchduration(
    String mid,
    int duration,
  ) async {
    await matchCollection.doc(mid).update({'duration': duration});
    print(duration);
    return duration;
  }

//update match status
  Future updateMatchstatus(
    String mid,
    bool status,
  ) async {
    await matchCollection.doc(mid).update({'status': status});
    return status;
  }

  //update nested players data
  Future updateNestedplayers(
    String mid,
    int team,
    bool status,
    int health,
    int kills,
    int deaths,
    int ammocount,
    int gun,
    String rescurcode,
    int lastKill,
    int lastshotby,
    int score,
    int tempid,
    bool isready,
  ) async {
    print(uid);
    return await matchCollection.doc(mid).collection('players').doc(uid).set({
      'team': team,
      'status': status,
      'health': health,
      'kills': kills,
      'deaths': deaths,
      'ammocount': ammocount,
      'gun': gun,
      'rescuecode': rescurcode,
      'lastkill': lastKill,
      'lastshotby': lastshotby,
      'score': score,
      'tempid': tempid,
      'isready': isready
    });
  }

  //update nested player data
  Future upadtenestedplayersdata(
    String mid,
    String field,
    int value,
  ) async {
    return await matchCollection
        .doc(mid)
        .collection('players')
        .doc(uid)
        .update({field: value});
  }

  //update is ready
  Future upadtenestedplayerisready(
    String mid,
    bool value,
  ) async {
    return await matchCollection
        .doc(mid)
        .collection('players')
        .doc(uid)
        .update({'isready': value});
  }

  //update player status
  Future upadtenestedplayerstatus(
    String mid,
    bool value,
  ) async {
    return await matchCollection
        .doc(mid)
        .collection('players')
        .doc(uid)
        .update({'status': value});
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
