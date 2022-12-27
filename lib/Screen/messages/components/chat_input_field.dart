import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {

  final controller=TextEditingController();
  String? _enteredMessage;
  bool changIcon=false;
  final Auth=FirebaseAuth.instance;


   _sendMessage()async{
     FocusScope.of(context).unfocus();
      final user=FirebaseAuth.instance.currentUser;
      final userData= await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
     FirebaseFirestore.instance.collection('chat').add({
       'text':_enteredMessage,
       'createdAt':Timestamp.now(),
      'username':userData['username'],
       'userId':user.uid,
       'userImage':userData['image_url']
     });
    controller.clear();
    setState(() {
      _enteredMessage="";
     //changIcon=true;


    });
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
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),//****
            blurRadius: 32,//*******
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
                      color: Theme.of(context)
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
                        onChanged: (value){
                          _enteredMessage=value;
                        setState(() {
                          changIcon=true;
                        });
                        },

                      ),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding),
            IconButton(
              color: kPrimaryColor,
              disabledColor: Colors.grey,
              icon:changIcon&&!_enteredMessage!.isEmpty?Icon(Icons.send):Icon(Icons.mic),
             onPressed: (){_enteredMessage!.trim().isEmpty?null:_sendMessage();
                 // changIcon=!changIcon;
             print(changIcon);
              }
              ),
          ],
        ),
      ),
    );
  }
}
