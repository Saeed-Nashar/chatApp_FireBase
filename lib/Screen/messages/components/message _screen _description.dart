import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/Screen/SignInorSignUp/registrationScreen/component/CameraUserPickImgae.dart';
import 'package:project2/Screen/chats/components/chat_card.dart';
import 'package:project2/models/Chat.dart';


import '../../../constants.dart';

class Message_Screen_description extends StatefulWidget {
  @override
  _Message_Screen_descriptionState createState() =>
      _Message_Screen_descriptionState();
}

class _Message_Screen_descriptionState
    extends State<Message_Screen_description> {
  void imagepickFn(File pickedImage) {
    _pickedImage = pickedImage;
  }

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource src) async {
    final pickedImageFile =
        await _picker.getImage(source: src, imageQuality: 50, maxWidth: 150);
    if (pickedImageFile != null) {
      setState(() {
        _pickedImage = File(pickedImageFile.path);
      });
      imagepickFn(_pickedImage!);
    } else {
      print("No Image selected");
    }
  }

  List Data = [
  Chat(
  name: "Saeed AL_Nashar",
  image: "assets/images/saeed.jpg",
    lastMessage: "Thinker",

  ),

    Chat(
        name: "Jacob Jones",
        lastMessage: "You’re welcome :)",
        image: "assets/images/user_4.png",
    ),
    Chat(
      name: "Albert Flores",
      lastMessage: "Thanks",
      image: "assets/images/user_5.png",
    ),
    Chat(
      name: "Jenny Wilson",
      lastMessage: "Hope you are doing well...",
      image: "assets/images/user_3.png",
    ),
    Chat(
      name: "Esther Howard",
      lastMessage: "Hello Abdullah! I am...",
      image: "assets/images/user_2.png",),
    Chat(
      name: "Ralph Edwards",
      lastMessage: "Do you have update...",
      image: "assets/images/user_3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
              SizedBox(height: 20,),
        // ProfileWidget(imagePath: 'assets/images/saeed.jpg', onClicked:(){}),
            CameraUserPickImage(imagePath: 'assets/images/saeed.jpg', imagepickFn: (File pickedImage) =>null ),
            buildName('Name','group', context),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text('  ${Data.length} participant' ,style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.search,color: kPrimaryColor,),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Data.length,
                       itemBuilder: (context, index) =>
                    ChatCard(
                   chat: Data[index],
        press:(){},
        ),
                  ),
                ],
              ),
            ),],
        ),
             ),
    );
  }
}

Widget buildName(String title,String name,BuildContext context) => Column(
  children: [
    Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
          ),
          subtitle:Text(
            name,
            style: TextStyle( fontSize:18,color:  MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.white
                :Colors.black,),
          ),

          trailing:  Icon(
            Icons.edit,
          ),
        ),
      ),
    ),
    Divider(indent: 28,color: Colors.grey,thickness: 1),


  ],
);
