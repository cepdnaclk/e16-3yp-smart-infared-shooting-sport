import 'package:flutter/material.dart';

class WaitingToStart extends StatefulWidget {
  @override
  _WaitingToStartState createState() => _WaitingToStartState();
}

class _WaitingToStartState extends State<WaitingToStart> {
  String _gameid = 'hhd63shd8438';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Waiting to Begin'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 1000.0,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back1.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.blueAccent.withOpacity(1.0), BlendMode.dstIn),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 40.0, left: 40.0),
                    color: Colors.white,
                    height: 30.0,
                    child: Row(
                      children: [
                        Text(
                          '  Game ID  :   ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          _gameid,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20.0, right: 10.0, left: 10.0),
                    alignment: Alignment.center,
                    //color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 1'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.red),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 2'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 3'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 4'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 5'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 6'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 7'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 8'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 9'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.blue[800],
                              child: Row(
                                children: [
                                  Text(' Player 0'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.red),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 0'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 1'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 2'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 3'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 4'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 5'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 6'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 7'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 8'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.green[800],
                              child: Row(
                                children: [
                                  Text(' Player 9'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 0'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 1'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 2'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 3'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 4'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.red),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 5'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 6'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 7'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 8'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.0,
                              color: Colors.yellow[800],
                              child: Row(
                                children: [
                                  Text(' Player 9'),
                                  Container(
                                    width: 20.0,
                                  ),
                                  const Icon(Icons.group_outlined,
                                      size: 10.0, color: Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
