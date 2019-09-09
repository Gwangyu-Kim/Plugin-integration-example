import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('com.example.batterylevel/battery');    //host의 MethodChannel명과 일치해야함.

  //Get battery level.
  String _batterLevel = "unkown";
  Future<void> _getBatteryLevel() async{
    String batteryLevel ;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      print(batteryLevel);
      print(result);
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e){
      batteryLevel = "Fail to get Battery level: '${e.message}'";
    }

    setState(() {
      _batterLevel = batteryLevel;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("Get Battery Level"),
              onPressed: _getBatteryLevel,
            ),
            Text(_batterLevel),
          ],
        ),
      ),
    );

  }


}

