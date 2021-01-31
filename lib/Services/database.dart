import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
    String msg,
  ) async {
    print(uid);
    String mid = matchCollection.doc().id;
    //print(mid);
    await matchCollection.doc(mid).set({
      'mode': mode,
      'status': status,
      'host': host,
      'isStart': isStart,
      'duration': duration,
      'msg': msg
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
      String name,
      int team,
      bool status,
      int health,
      int kills,
      int deaths,
      String userid,
      int gun,
      String rescurcode,
      int lastKill,
      int lastshotby,
      int score,
      int tempid,
      bool isready,
      int lastkillTeam,
      String lastkillName,
      int lastshotbyTeam,
      String lastshotbyName) async {
    print(uid);
    return await matchCollection.doc(mid).collection('players').doc(uid).set({
      'team': team,
      'name': name,
      'status': status,
      'health': health,
      'kills': kills,
      'deaths': deaths,
      'userid': userid,
      'gun': gun,
      'rescuecode': rescurcode,
      'lastkill': lastKill,
      'lastshotby': lastshotby,
      'score': score,
      'tempid': tempid,
      'isready': isready,
      'lastkillTeam': lastkillTeam,
      'lastkillName': lastkillName,
      'lastshotbyTeam': lastshotbyTeam,
      'lstshotbyName': lastshotbyName,
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

//when get shot **************************************************************************************
  Future getshootedplayerdata(String mid, int teamid, int tempid) async {
    String name;
    await matchCollection
        .doc(mid)
        .collection('players')
        .where('team', isEqualTo: teamid)
        .where('tempid', isEqualTo: teamid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        name = element['userid'];
        //print(name);
      });
    });
    return name;
  }

//set killers data
  Future updatehisdata(
    String mid,
    String killerUid,
    int teamid,
    int tempid,
    String name,
  ) async {
    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(killerUid)
        .update({'lastkill': tempid});
    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(killerUid)
        .update({'lastkillTeam': teamid});
    return await matchCollection
        .doc(mid)
        .collection('players')
        .doc(killerUid)
        .update({'lastkillName': name});
  }
//set my data

  Future setmyshotdata(String mid, String killeruid) async {
    String hisname;
    String myname;
    int team;
    int tempid;
    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(killeruid)
        .get()
        .then((value) {
      hisname = value.data()['name'];
      team = value.data()['team'];
      tempid = value.data()['userid'];
      //print(name);
    });

    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(uid)
        .get()
        .then((value) {
      myname = value.data()['name'];
      //print(name);
    });
    //set the game msg
    String msg = myname + ' is killed by ' + hisname;
    await matchCollection.doc(mid).update({'msg': msg});

    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(uid)
        .update({'lastshotbyName': hisname});
    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(uid)
        .update({'lastshotbyTeam': team});
    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(uid)
        .update({'lastshotby': tempid});
    return 1;
  }

  //increase enemy player score
  Future increasehisscorre(String hisuid, String mid, int demage) async {
    int currentscore;
    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(hisuid)
        .get()
        .then((value) {
      currentscore = value.data()['score'];
      //print(name);
    });
    currentscore = currentscore + demage;
    await matchCollection
        .doc(mid)
        .collection('players')
        .doc(hisuid)
        .update({'score': currentscore});
  }

  //after match updates*************************************************************************************************

  Future updateaftermatchnesteddata(
    String mid,
    int health,
    int kills,
    int deaths,
    int gun,
    int team,
    bool iswin,
  ) async {
    print(uid);
    return await playerCollection
        .doc(uid)
        .collection('playedmatch')
        .doc(mid)
        .set({
      'team': team,
      'status': iswin,
      'health': health,
      'kills': kills,
      'deaths': deaths,
      'gun': gun,
    });
  }

  //update playerbasic data
  Future setmybasicdata(int _kills, int _deaths, bool iswin) async {
    int kills;
    int deaths;
    int battleplayed;
    int battlewon;
    await playerCollection.doc(uid).get().then((value) {
      battleplayed = value.data()['Battles Played'];
      deaths = value.data()['Total Deaths'];
      kills = value.data()['Total Kills'];
      battlewon = value.data()['Battles Won'];
    });
//set data
    battleplayed = battleplayed + 1;
    deaths = deaths + _deaths;
    kills = kills + _kills;
    if (iswin) {
      battlewon = battlewon + 1;
    }
    await playerCollection.doc(uid).update({'Battles Played': battleplayed});
    await playerCollection.doc(uid).update({'Total Deaths': deaths});
    await playerCollection.doc(uid).update({'Total Kills': kills});
    await playerCollection.doc(uid).update({'Battles Won': battlewon});

    return 1;
  }

  //delete the match data after the match

  Future deletematchdata(
    String mid,
  ) async {
    return await matchCollection.doc(mid).delete().then((value) {
      print('sucessfulle deleted');
    });
  }

//setting the tempid***********************************************************************************************************

  Future settempid(String mid) async {
    int team1 = 0;
    int team2 = 0;
    int team3 = 0;
    String userid;
    int compareid;
    var result = await matchCollection.doc(mid).collection('players').get();

    result.docs.forEach((res) {
      compareid = res.data()['team'];
      userid = res.data()['userid'];
      print(userid);
      print(team3);
      print(res.data()['team']);

      if (compareid == 1) {
        matchCollection
            .doc(mid)
            .collection('players')
            .doc(userid)
            .update({'tempid': team1});
        team1++;
      } else if (compareid == 2) {
        matchCollection
            .doc(mid)
            .collection('players')
            .doc(userid)
            .update({'tempid': team2});
        team2++;
      }

      if (compareid == 3) {
        matchCollection
            .doc(mid)
            .collection('players')
            .doc(userid)
            .update({'tempid': team3});
        team3++;
      }
    });

    return 1;
  }

  //players list
  List<Player> _playerListFromSnampshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Player(
        name: doc.data()['name'] ?? '',
      );
    }).toList();
  }

  //Get players Stream
  Stream<List<Player>> get players {
    return playerCollection.snapshots().map(_playerListFromSnampshot);
  }
}
