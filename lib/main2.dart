import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

main() => runApp(MaterialApp(home: PlatformIntegrationTest()));

class PlatformIntegrationTest extends StatefulWidget {
  @override
  _PlatformIntegrationTestState createState() => _PlatformIntegrationTestState();
}

class _PlatformIntegrationTestState extends State<PlatformIntegrationTest> {
  static const  METHODCHANNEL = const MethodChannel('com.example.battery/battery');

  @override
  Widget build(BuildContext context) {
    return Material();
  }
}
