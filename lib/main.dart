import 'package:fingerprint_login/services/local_authentication_service.dart';
import 'package:fingerprint_login/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LocalAuthenticationService _localAuth = locator<LocalAuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.crop_free , color: Colors.white,size: 30.0),
        ),
        title: _localAuth.isAuthenticated ? Text('Already Loged In'):Text('Local Authentication'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('authenticate'),
          onPressed: _localAuth.authenticate,
        ),
      ),
    );
  }
}