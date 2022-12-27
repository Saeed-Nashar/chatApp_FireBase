
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project2/models/Chat.dart';


import '../../../constants.dart';




class contactCard extends StatefulWidget {
  contactCard( Chat contact);


  @override
  _contactCardState createState() => _contactCardState();
}

class _contactCardState extends State<contactCard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
bool ?isLoading;
  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;


    await _firestore
        .collection('users')
        .where("email")
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();

      });
      print(userMap);
    });
  }

  Map<String, dynamic>? userMap;

  @override
  Widget build(BuildContext context) {
    return  userMap != null
        ? ListTile(
        onTap: () {},
        leading:  CircleAvatar(
         radius: 24,
         backgroundImage: NetworkImage(userMap!['image_url'],),
       ),
       title: Text(userMap!['username'], style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500,
       ),
       ),
       subtitle: Text(userMap!['email']),
       trailing: Icon(Icons.chat, color: Colors.black),
     ): Container();
  }
}
