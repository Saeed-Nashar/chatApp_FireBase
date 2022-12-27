

import 'dart:io';

import 'package:flutter/cupertino.dart';

class chatModel{
  @required String name;
  @required String icon;
  @required bool isGroup;
  @required String time;
  @required String currentMessage;
  @required  String status;
  @required  bool select =false;

  chatModel({required this.name,required this.icon,required this.isGroup,required this.time,required this.currentMessage,required this.status,this.select=false});
}