
import 'package:flutter/material.dart';
import 'package:project2/Screen/messages/message_screen.dart';
import 'package:project2/models/Chat.dart';

import 'group_Card.dart';


class Body extends StatelessWidget {
final List<Chat> ChatGroup=[
  Chat(
    name: "Group",
    lastMessage: "Hope you are doing well...",
    image: "assets/icons/groups.svg",
    time: "3m ago",
    isActive: false,
  ),
];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: ChatGroup.length,
        itemBuilder: (context,index)=>group_Card(
          chat: ChatGroup[index],
          press: () =>
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(),
                ),
              ),
        ),
      ),
    );
  }
}