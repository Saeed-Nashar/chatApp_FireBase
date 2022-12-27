import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../constants.dart';

class ChatInputfield extends StatefulWidget {
  final String chatRoomId;

  const ChatInputfield({Key? key, required this.chatRoomId}) : super(key: key);
  @override
  _ChatInputfieldState createState() => _ChatInputfieldState();
}

class _ChatInputfieldState extends State<ChatInputfield> {

  final controller = TextEditingController();
  String? _enteredMessage;
  bool changIcon = false;
  final Auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController ?Message;

  File?imageFile;

  Future getImage(ImageSource src) async {
    ImagePicker _picker = ImagePicker();

    final pickedImageFile =
    await _picker.pickImage(source: src).then((xfile) {
      if (xfile != null) {
        imageFile=File(xfile.path);
        uploadImage();
      }
    });
  }

  /*  if (pickedImageFile != null) {
      setState(() {
        _pickedImage = File(pickedImageFile.path);
      });
      widget.imagepickFn(_pickedImage);
    } else {
      print("No Image selected");
    }
  }*/

  Future uploadImage()async{
    int status=1;
    String fileName =Uuid().v1();

    await _firestore
        .collection('chatroom')
        .doc(widget.chatRoomId)
        .collection('chat').doc(fileName).set({
      "sendby": _auth.currentUser!.displayName,
      "message": "",
      "type": "img",
      "time": FieldValue.serverTimestamp(),
    });

    var ref =FirebaseStorage.instance.ref("images").child("$fileName.jpg");

    var uploadTask=await ref.putFile(imageFile!).catchError((error)async{
    await _firestore
        .collection('chatroom')
        .doc(widget.chatRoomId)
        .collection('chat').
         doc(fileName)
        .delete();
    status=0;
    });
    if(status==1){
      String ImageUrl= await uploadTask.ref.getDownloadURL();
      await _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chat').doc(fileName).update({"message": ImageUrl});
      print(ImageUrl);
    }
  }


  void onSendMessage() async {
    if (controller.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser!.displayName,
        "message": controller.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };
      FocusScope.of(context).unfocus();
      controller.clear();
      await _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chat')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }


  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    controller.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    controller.dispose();
    // changIcon=!changIcon;
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${controller.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4), //****
            blurRadius: 32, //*******
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.sentiment_satisfied_alt_outlined),
                      color: Theme
                          .of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                      onPressed: () {
                        //   getMessage();
                        //  getUser();
                        // chataStream();
                      },
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        autocorrect: true,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.sentences,
                        controller: controller,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.all(5),
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _enteredMessage = value;
                          setState(() {
                            changIcon = true;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.attach_file,
                        color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                      ),
                      onPressed: () {
                        showModalBottomSheet(context: context,
                            backgroundColor: Colors.transparent,
                            builder: (builder) =>
                                bottomSheet(context));
                      },
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    IconButton(
                     icon:   Icon(Icons.camera_alt_outlined,
                        color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64)
                    ),
                    onPressed: (){getImage(ImageSource.camera);},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding),
            IconButton(
                color: kPrimaryColor,
                disabledColor: Colors.grey,
                icon: changIcon && !_enteredMessage!.isEmpty
                    ? Icon(Icons.send)
                    : Icon(Icons.mic),

                onPressed: () {
                  _enteredMessage!.trim().isEmpty ? null : onSendMessage();
                  changIcon = !changIcon;
                }
              // changIcon=!changIcon;
            ),
          ],
        ),
      ),
    );
  }



Widget bottomSheet(BuildContext context) {
  return Container(
    height: 279,
    width: MediaQuery.of(context).size.width,
    child: Card(
      margin: EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: incorrect(Icon(Icons.insert_drive_file), Colors.indigo, "Document",(){})),
                //     SizedBox(width: 40,),
                Expanded(child:incorrect(Icon(Icons.camera_alt), Colors.pink, "Camera",()=> getImage(ImageSource.camera) )),
                //   SizedBox(width: 40,),
                Expanded(child:incorrect(Icon(Icons.insert_photo), Colors.purple, "Gallery",()=> getImage(ImageSource.gallery))),
                //   SizedBox(width: 40,),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: incorrect(Icon(Icons.headset), Colors.orange, "Audio",(){})),
                //     SizedBox(width: 40,),
                Expanded(child:incorrect(Icon(Icons.location_pin), Colors.teal, "Location",(){})),
                //   SizedBox(width: 40,),
                Expanded(child:incorrect(Icon(Icons.insert_photo), Colors.blue, "Contact",(){})),
                //   SizedBox(width: 40,),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
Widget incorrect(Icon icon,Color color ,String text,Function function ){
  return InkWell(
    onTap: (){},
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: IconButton(icon: icon,iconSize: 29,color: Colors.white,
          onPressed: ()=>function,),
        ),
        Text(text,style:TextStyle(fontSize: 13),),
      ],

    ),
  );
}
}