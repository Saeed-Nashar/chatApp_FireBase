import 'package:flutter/cupertino.dart';

enum ChatMessageType { text, audio, image, video }//***
enum MessageStatus { not_sent, not_view, viewed }//***

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  final userName;
  final String userimage;

  ChatMessage(  {
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
    this.userName,
    required this.userimage,
  });
}

/*List demeChatMessages = [
  ChatMessage(
    text: "Hi abd,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,

  ),
  ChatMessage(
    text: "Hello Saeed, How are you?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Error happend",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,//لم ترسل الرسالة بسبب مسبب (النت)
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great man!!",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad you like it",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,// اشارة الصح لعدم القراءة
    isSender: true,
  ),
];*/
