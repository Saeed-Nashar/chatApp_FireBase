import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../../../constants.dart';



class MessagesScreenIndiviual extends StatefulWidget {
  @override
  _MessagesScreenIndiviualState createState() => _MessagesScreenIndiviualState();
}

class _MessagesScreenIndiviualState extends State<MessagesScreenIndiviual> {
  Map<String, dynamic>? userMap;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;


    await _firestore
        .collection('users')
      //  .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();

      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
    //  body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext ctx,) {

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          InkWell(
            onTap: (){
              //Navigator.push(ctx, MaterialPageRoute(builder: (builder)=>Message_Screen_description()));
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:AssetImage(userMap!['image_url'],),
                ),
                SizedBox(width: kDefaultPadding * 0.75),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userMap!['username'],
                      style: TextStyle(fontSize: 16),
                    ),
                   /* Text(
                      "Active 3m ago",
                      style: TextStyle(fontSize: 12),
                    )*/
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
