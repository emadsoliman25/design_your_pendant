import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(DesignIt());

class DesignIt extends StatefulWidget {
  @override
  _DesignItState createState() => _DesignItState();
}

class _DesignItState extends State<DesignIt> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.teal,
        ),
      ),
      home: Home(),
    );
  }
}
