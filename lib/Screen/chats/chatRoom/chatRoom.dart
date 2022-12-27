
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:project2/components/chatInputfield.dart';

import '../../../constants.dart';

class ChatRoom extends StatefulWidget {

  final Map<String, dynamic> userMap ;
  final String chatRoomId;

  ChatRoom({required this.chatRoomId, required this.userMap});

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _message = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser!.displayName,
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      _message.clear();
      await _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chat')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }

  final controller = TextEditingController();

  String? _enteredMessage;

  bool changIcon = false;

  final Auth = FirebaseAuth.instance;

  TextEditingController ?Message;


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
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        titleSpacing: 2,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 24,)),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.userMap['image_url'],
              ),
              radius: 24,
            ),
          ],
        ),
        title: StreamBuilder<DocumentSnapshot>(
          stream: _firestore.collection("users").doc(widget.userMap['uid']).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Container(
                child: Column(
                  children: [
                    Text(widget.userMap['username']),
                    Text(
                      snapshot.data!['status'],
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),

        actions: [
          IconButton(icon: Icon(Icons.videocam), onPressed: () {},),
          IconButton(
            icon: Icon(Icons.call), onPressed: () {}, color: Colors.white,),
          PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("View contact"), value: "View contact",),
                  PopupMenuItem(child: Text("Media,links and docs"),
                    value: "Media,links and docs",),
                  PopupMenuItem(
                    child: Text("Whatsapp web"), value: "Whatsapp web",),
                  PopupMenuItem(child: Text("Search"), value: "Search",),
                  PopupMenuItem(child: Text("Mute Notification"),
                    value: "Mute Notification",),
                  PopupMenuItem(child: Text("Wallpaper"), value: "Wallpaper",),
                ];
              }),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height / 1.25,
                width: size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('chatroom')
                      .doc(widget.chatRoomId)
                      .collection('chat')
                      .orderBy("time", descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> map = snapshot.data!.docs[index]
                                .data() as Map<String, dynamic>;
                            return messages(size, map, context);
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
               ChatInputfield(chatRoomId: widget.chatRoomId),
            ],
          ),
        ),
    );
  }

  Widget messages(Size size, Map<String, dynamic> map, BuildContext context) {
    return map['type'] == "text" ? Container(
      width: size.width,
      alignment: map['sendby'] == _auth.currentUser!.displayName
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75,
          vertical: kDefaultPadding / 2,),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor.withOpacity(
              map['sendby'] == _auth.currentUser!.displayName ? 1 : 0.1),
        ),
        child: Text(
          map['message'],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: map['sendby'] == _auth.currentUser!.displayName ?
            Colors.white : Theme
                .of(context)
                .textTheme
                .bodyText2!
                .color,
          ),
        ),
      ),
    ) : Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      alignment: map['sendby'] == _auth.currentUser!.displayName
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: InkWell(
          onTap: () =>
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ShowImage(
                        imageUrl: map['message'],
                      ),
                ),
              ),
          child: AspectRatio(
            aspectRatio: 1.6,
            child: Stack(
              alignment: map['sendby'] == _auth.currentUser!.displayName
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              children:[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                  alignment: map['message'] != "" ? null : Alignment.center,
                  child: map['message'] != ""
                      ? Image.network(
                    map['message'],
                    fit: BoxFit.cover,
                    height: 220,
                    width: 180,
                  )
                      : CircularProgressIndicator(),
              ),
                ),
               /* Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 16,
                    color: Colors.white,
                  ),
                )*/
            ],
            ),
          ),
        ),
      ),
    );
  }
  }

class ShowImage extends StatelessWidget {
  final String imageUrl;
  const ShowImage({required this.imageUrl, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.black,
     ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}


