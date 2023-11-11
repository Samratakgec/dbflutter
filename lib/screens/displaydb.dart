import 'package:db/services/dbhelper.dart';
import 'package:flutter/material.dart';

class Dbcout extends StatefulWidget {
  const Dbcout({super.key});

  @override
  State<Dbcout> createState() => _DbcoutState();
}

class _DbcoutState extends State<Dbcout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Db'),
      ),
      body: Column(children: []),
    );
  }
}
