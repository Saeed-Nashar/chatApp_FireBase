import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../indiviusalScreen.dart';
import 'ChatModel.dart';



class customCard extends StatelessWidget {
  final chatModel chatmodel;

  customCard( {required this.chatmodel});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => indiviualSccreen(chatmodel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(/*  صفحة  chats*/
              backgroundColor: Colors.grey,
              child: SvgPicture.asset(
                chatmodel.isGroup ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                width: 37,
                height: 37,
              ),
              radius: 30,
            ),
            title: Text(
              chatmodel.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 4,
                ),
                Text(
                  chatmodel.currentMessage,
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: Text(chatmodel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 20),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
