import 'package:flutter/material.dart';

import 'component/ChatModel.dart';
import 'component/customCard.dart';


class chatPage extends StatefulWidget {
  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  List <chatModel> chats=[
    chatModel(
      name:"صحارى مول",
      icon:"person.svg",
      isGroup:false,
      time:"4:00",
      currentMessage:"hi", status: "",
    ),
    chatModel(
        name:"shopping center 2",
        icon:"person.svg",
        isGroup:false,
        time:"16:00",
        currentMessage:"How are you",
        status: "", ),
    chatModel(
        name:"shopping center 3",
        icon:"groups.svg",
        isGroup:true,
        time:"6:00",
        currentMessage:"what are you doing",
        status: "",
    ),chatModel(
      name:"shopping center 4",
      icon:"groups.svg",
      isGroup:false,
      time:"6:00",
      currentMessage:"every thing is good",
      status: "",
    ),chatModel(
      name:"shopping center 5",
      icon:"groups.svg",
      isGroup:true,
      time:"6:00",
      currentMessage:"I am fine thank you",
      status: "",
    ),
    chatModel(
        name:"shopping center n",
        icon:"person.svg",
        isGroup:false,
        time:"2:00",
        currentMessage:"Hi",
        status: "",

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder:(context,index)=>customCard(
          chatmodel:chats[index],
        ),
      ),
    );
  }
}
