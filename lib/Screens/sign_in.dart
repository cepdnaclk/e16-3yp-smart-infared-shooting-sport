import 'package:flutter/material.dart';
import 'package:xtag_demo/Services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Textfield state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back1.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.blueAccent.withOpacity(1.0), BlendMode.dstIn))),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(hintText: 'Email address'),
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
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
                  maxLength: 10,
                  //keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    hoverColor: Colors.black,
                  ),
                  obscureText: true,
                  validator: (val) =>
                      val.length < 6 ? 'Password must be 6 + long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.red,
                  child: Text(
                    'SignedIN',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'You Credentials are wrong');
                      }
                      print(email);
                      print(password);
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            )),
      ),
    );
  }
}
