import 'package:flutter/material.dart';
import 'package:login_app/settings.dart';
import 'package:login_app/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget{
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>{
  String _title = 'Please Login';
  Widget _screen;
  home _login;
  settings _settings;
  bool _authenticated;

  _MyAppState() {
    _login = new home(onSubmit: (){onSubmit();});
    _settings = new settings();
    _screen = _login;
    _authenticated = false;
  }

  void onSubmit() {
    print('Login with: ' + _login.username + ' ' + _login.password);
    if(_login.username == '12345' && _login.password == '23456') {
      _setAuthenticated(true);
    }
  }

  void _goHomme(){
    print('go home $_authenticated');

    setState(() {
      if(_authenticated == true) {
        _screen = _settings;
      }
      else {
        _screen = _login;
      }
    }
    );
  }

  void _logout(){
    print('log out');
    _setAuthenticated(false);

  }

   @override
  Widget build(BuildContext context){
     return new MaterialApp(
       title: 'Login',
       theme: new ThemeData(primarySwatch: Colors.yellow),
       home: new Scaffold(
         appBar: new AppBar(title: new Text(_title),
         actions: <Widget>[
           new IconButton(icon: new Icon(Icons.home), onPressed: (){ _goHomme();}),
           new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){_logout();} )
         ],),
       body: _screen,
       ),
     );
   }
  void _setAuthenticated(bool auth) {
    setState(() {
      if(auth == true) {
        _screen = _settings;
        _title = 'Welcome';
        _authenticated = true;
      }
      else {
        _screen = _login;
        _title = 'Please Login';
        _authenticated = false;
      }
    }
    );
  }
}
