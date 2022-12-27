import 'dart:math';

import 'package:flutter/material.dart';
class HeadOwnStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/saeed.jpg"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.greenAccent[700],
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "My Status",
        style: TextStyle(fontWeight: FontWeight.bold, /*color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.white
            :Colors.black,*/),
      ),
      subtitle: Text(
        "Tap to add status update",
        style: TextStyle(fontSize: 13,/* color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.white
            :Colors.greenAccent[900]*/),
      ),
    );
  }

}