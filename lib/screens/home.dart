// ignore_for_file: avoid_unnecessary_containers

import 'package:db/screens/displaydb.dart';
import 'package:db/services/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController _textEditingController = TextEditingController();
  String userInput = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('leaning db'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(labelText: 'Enter text'),
          ),
          InkWell(
            child: Container(
              height: 50,
              width: 50,
              child: const Text('Submit to db'),
              color: Colors.blueAccent,
            ),
            onTap: () async {
              userInput = _textEditingController.text;
              await DbHelper.instance.insert({DbHelper.columnName: userInput});
            },
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            child: Container(
              height: 50,
              width: 50,
              child: const Text('Show db'),
              color: Colors.blueAccent,
            ),
            onTap: () async {
              var dbquery = await DbHelper.instance.queryDatabse();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Dbcout(); // Replace with the screen you want to navigate to.
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
