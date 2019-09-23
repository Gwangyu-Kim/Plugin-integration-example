import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



main() => runApp(MaterialApp(home: PlatformChannel()));

class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  static const platform = const MethodChannel('com.example.batterylevel/battery');

  String _batteryLevel = 'get Battery level';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatterLevel,
            ),
            Text(_batteryLevel)
          ],
        ),
      ),
    );
  }

  Future<void> _getBatterLevel() async {
    print('1111');
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'battery level is $result%';
      print(batteryLevel);
    } on PlatformException catch (e) {
      batteryLevel = "Can't reach at battery level.  ... ${e.message}";
    }


    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}



