

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';


import 'component/ChatModel.dart';
import 'component/ReplyCard.dart';
import 'component/ownMessageCard.dart';


class indiviualSccreen extends StatefulWidget {
  final chatModel chatmodel;

  const indiviualSccreen(this.chatmodel);

  @override
  _indiviualSccreenState createState() => _indiviualSccreenState();
}

class _indiviualSccreenState extends State<indiviualSccreen> {


  FocusNode _focusNode = FocusNode();
  bool show = false;
  TextEditingController _controller = TextEditingController();

  final List <String> task=[];
  // final List  pgoto=[];



  _sendMessage()async{
    FocusScope.of(context).unfocus();

    _controller.clear();

  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/whatsapp background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            leadingWidth: 90,
            titleSpacing: 0,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                    )),
                CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  child: SvgPicture.asset(
                    widget.chatmodel.isGroup
                        ? "assets/groups.svg"
                        : "assets/person.svg",
                    color: Colors.white,
                    width: 37,
                    height: 37,
                  ),
                  radius: 25,
                ),
              ],
            ),
            title: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatmodel.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.chatmodel.time,
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WillPopScope(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/whatsapp background.png",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 140,
                    child://محادثة افتراضية

                    ListView(
                      children: [
                        if(widget.chatmodel.currentMessage=="hi")ownMessageCard(),
                        if(widget.chatmodel.currentMessage=="hi") ReplyCard(),

                        task.length>0?ListView.builder(
                          reverse: false,
                          shrinkWrap: true,
                          itemCount: task.length,
                          itemBuilder: (context,index)=>
                              Align(
                                alignment: Alignment.centerRight,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width-45,
                                  ),
                                  child:  Card(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    color: Color(0xffdcf8c6),
                                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                    child: Stack(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10,right: 60,top: 5,bottom: 20),
                                          child: Text(task[index],style: TextStyle(fontSize: 15),),
                                        ),
                                        Positioned(
                                          bottom:0,
                                          right: 10,
                                          child: Row(
                                            children: [
                                              Text("20:58",style: TextStyle(fontSize: 13),),
                                              SizedBox(width: 5,),
                                              Icon(Icons.done_all),

                                            ],
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                        ):Container(),

                      ],),

                  ),



                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextFormField(
                                  controller: _controller,
                                  focusNode: _focusNode,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      contentPadding: EdgeInsets.all(15)

                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF075E54),
                                  radius: 25,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.send_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {

                                      setState(() {
                                        task.add(_controller.text);
                                        _sendMessage();
                                        _controller.clear();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        show
                            ? Container()

                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }



}

/*
class photoMessage extends StatelessWidget {
  File ? image;
  photoMessage(this.image);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45, // 45% of total width
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Padding(
          padding: EdgeInsets.only(left: 250),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                   child:image==null? null:Image.file(image!),
                )),

            ],
          ),
        ),
      ),
    );
  }
}
*/
