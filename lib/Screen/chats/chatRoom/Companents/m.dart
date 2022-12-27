

import 'package:flutter/material.dart';
import 'package:project2/Screen/chats/chatRoom/Companents/textM.dart';
import 'package:project2/models/ChatMessage.dart';


import '../../../../constants.dart';



class MessageM extends StatelessWidget {


  final Map<String, dynamic>? message;

  const MessageM({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget messageContaint( Map<String, dynamic>?message) {
      switch (message!['type']) {
        case ChatMessageType.text:
          return textM(message: message['message']);
       /* case ChatMessageType.audio:
          return AudioMessage(message: message!['message']);
        case ChatMessageType.video:
          return VideoMessage();*/
        default:
          return SizedBox();
      }
    }


    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
        message!['sendby'] ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message!['sendby']) ...[  //*********
           /* CircleAvatar(
                radius: 12,
                backgroundImage:NetworkImage(message!['user_url'])
              //AssetImage("assets/images/saeed.jpg"),
            ),*/
            SizedBox(width: kDefaultPadding / 2),
          ],
          Text(message!['message']),
          messageContaint(message),
        /*  if(message.isSender) MessageStatusDot(status: message.messageStatus)*/
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status; //حالة ارسال الرسالة

  const MessageStatusDot({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Colors.grey;
      //Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return kPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

}
