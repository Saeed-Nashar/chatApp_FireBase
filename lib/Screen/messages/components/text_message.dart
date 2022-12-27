

import 'package:flutter/material.dart';
import 'package:project2/models/ChatMessage.dart';


import '../../../constants.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(message!.isSender ? 1 : 0.1),//****
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
       if(message!.isSender)  Text(
            "you",
            style: TextStyle(
              color: message!.isSender
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText2!.color,
              fontWeight: FontWeight.bold,
            ),
         ),
          if(!message!.isSender)   Text(
            message!.userName,
            style: TextStyle(
              color: message!.isSender
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText2!.color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            message!.text,
            style: TextStyle(
              color: message!.isSender
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
      ),
    );
  }
}
