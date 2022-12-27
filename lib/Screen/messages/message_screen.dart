import 'dart:io';


import 'package:flutter/material.dart';


import '../../constants.dart';
import 'components/VideoCallingWithAgora.dart';
import 'components/body.dart';
import 'components/message _screen _description.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext ctx,) {

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          InkWell(
            onTap: (){Navigator.push(ctx, MaterialPageRoute(builder: (builder)=>Message_Screen_description()));},
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:AssetImage("assets/images/saeed.jpg"),
                ),
                SizedBox(width: kDefaultPadding * 0.75),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saeed AL_Nashar",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Active 3m ago",
                      style: TextStyle(fontSize: 12),
                    )
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
          onPressed: () {
      //   Navigator.push(ctx, MaterialPageRoute(builder: (builder)=>VideoCalling()));
          },
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
