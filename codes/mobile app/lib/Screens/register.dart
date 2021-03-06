import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Screens/sign_in.dart';
import 'package:xtag_demo/Screens/verify.dart';
import 'package:xtag_demo/Services/auth.dart';
import 'package:xtag_demo/Services/massages.dart';
import 'package:xtag_demo/Shared/loading.dart';

import '../home.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Textfield state
  String userName = '';
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0.0,
              title: Text('Register'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    'SignIn',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 1000.0,
                    //constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/back1.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.blueAccent.withOpacity(1.0),
                                BlendMode.dstIn))),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                              decoration:
                                  InputDecoration(hintText: 'Email address'),
                              validator: (val) => val.isEmpty
                                  ? 'Please enter Valid Email'
                                  : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                              decoration:
                                  InputDecoration(hintText: 'User Name'),
                              validator: (val) => val.isEmpty
                                  ? 'Please enter  User Name'
                                  : null,
                              onChanged: (val) {
                                setState(() => userName = val);
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                              maxLength: 10,
                              //keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                fillColor: Colors.white,
                                hoverColor: Colors.black,
                              ),
                              obscureText: true,
                              validator: (val) => val.length < 6
                                  ? 'Password must be 6 + long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            RaisedButton(
                              color: Colors.blue[500],
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue[800],
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                '  Register  ',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.regWithEmailAndPassword(
                                          email, password, userName);
                                  print(result);
                                  if (result == null) {
                                    setState(() => error = Massages.regerror);
                                    loading = false;
                                  } else {
                                    widget.toggleView();
                                    await _auth.signOut();
                                  }

                                  print(email);
                                  print(password);
                                }
                              },
                            ),
                            /*RaisedButton(
                        color: Colors.blue[500],
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.blue[800],
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          '  RegisterV  ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        onPressed: () {
                          auth
                              .createUserWithEmailAndPassword(
                                  email: email, password: password)
                              .then((_) {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => VerifyScreen()));
                          });
                        },
                      ),*/
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
  }
}
