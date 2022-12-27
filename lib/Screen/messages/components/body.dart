
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/ChatMessage.dart';


import '../../../constants.dart';
import 'chat_input_field.dart';
import 'message.dart';


class Body extends StatelessWidget {

  final  user=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: true).snapshots(),
            builder:(contex,snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              List<Text> chatsWidgets = [];
              if (!snapshot.hasData) {}
              final message = snapshot.data!.docs;
              for (var m in message) {
                final messageText = m.get('text');
                final chatWidget = Text('$messageText');
                chatsWidgets.add(chatWidget);
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding),
                  child: ListView.builder(
                    reverse: true,
                      itemCount: message.length,
                      itemBuilder: (context, index) =>
                      Message(
                        message:ChatMessage(
                        isSender: message[index]['userId']==user!.uid,
                        messageStatus: MessageStatus.viewed,
                        messageType: ChatMessageType.text,
                          text: message[index]['text'],
                        userName: message[index]['username'],
                        userimage: message[index]['userImage'],
                      ),),),
                  ),
              );
            },
            ),
        ChatInputField(),
      ],
    );
  }
}