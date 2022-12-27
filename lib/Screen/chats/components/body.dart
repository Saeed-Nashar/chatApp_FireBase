import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/Screen/chats/chatRoom/chatRoom.dart';

import '../../../constants.dart';
import 'chat_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, dynamic>? userMap;

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore.collection('users').get().then((value) {
      userMap = value.docs[0].data();

      print(userMap);
    });
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;

  List roomList = [];

  @override
  void initState() {
    super.initState();
    getAvailableGroups();
  }

  void getAvailableGroups() async {
    String uid = _auth.currentUser!.uid;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('rooms')
        .get()
        .then((value) {
      setState(() {
        roomList = value.docs;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (ctx, snapshot) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    _firestore.collection('users').get().then((value) {

      userMap =value.docs[0].data();

    print(userMap);
    });
    String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
    user2.toLowerCase().codeUnits[0]) {
    return "$user1$user2";
    } else {
    return "$user2$user1";
    }
    }


    return userMap != null
    ? ListTile(
        onTap: () {
          String roomId = chatRoomId(
              FirebaseAuth.instance.currentUser!.displayName!,
              userMap!['username']);

          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) =>
                      ChatRoom(
                        chatRoomId: roomId,
                        userMap: userMap!,
                      )
              ));
        },
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(userMap!['image_url'],),
        ),
        title: Text(
          userMap!['username'],
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
       subtitle: Text(userMap!['email']),
        trailing: Icon(Icons.chat, color: Colors.black),

    )
              : Container();
     }
        );
      }

  }


/*isLoading
        ? Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
      itemCount: roomList.length,
      itemBuilder: (context, index) {
        String chatRoomId(String user1, String user2) {
          if (user1[0].toLowerCase().codeUnits[0] >
              user2.toLowerCase().codeUnits[0]) {
            return "$user1$user2";
          } else {
            return "$user2$user1";
          }
        }

        return ListTile(
          onTap: () {
            String roomId = chatRoomId(
                FirebaseAuth.instance.currentUser!.displayName!,
                roomList[index]['username']);
            Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>ChatRoom(
                chatRoomId: roomId,
                userMap: roomList[index]['username']!,
              ),
            ),
          );
          },

          leading: Icon(Icons.group),
          title: Text(roomList[index]['username']),
        );
      },
    );*/

/*StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (ctx, snapshot) {
          FirebaseFirestore _firestore = FirebaseFirestore.instance;

         _firestore.collection('users').get().then((value) {
            userMap = value.docs[0].data();

            print(userMap);
          });
          String chatRoomId(String user1, String user2) {
            if (user1[0].toLowerCase().codeUnits[0] >
                user2.toLowerCase().codeUnits[0]) {
              return "$user1$user2";
            } else {
              return "$user2$user1";
            }
          }


          return userMap != null
              ? ListTile(
                  onTap: () {

                   String roomId = chatRoomId(
                          FirebaseAuth.instance.currentUser!.displayName!,
                          userMap!['username']);

                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              )
                          ));

                  },
                  */ /*   leading:  CircleAvatar(
                 radius: 24,
                 backgroundImage: AssetImage(userMap!['image_url'],),
               ),*/ /*
                  title: Text(
                    userMap!['username'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(userMap!['email']),
                  trailing: Icon(Icons.chat, color: Colors.black),
                )
              : Container();
        }
        );*/

// child: Column(
//  children: [
//    Container(
//padding: EdgeInsets.fromLTRB(  //************ for Container under appBarr
//  kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
//color: kPrimaryColor,
//  child: Row(
//children: [
//FillOutlineButton(press: () {}, text: "Recent Message"),
//  SizedBox(width: kDefaultPadding),
//    FillOutlineButton(
//        press: () {},
// text: "Online",
//   isFilled: false,
//   ),
//   ],
//   ),
//   ),
//Expanded(
// child: ListView.builder(
//itemCount: chatsData.length,
//itemBuilder: (context, index) => ChatCard(
//chat: chatsData[index],
// press: () => Navigator.push(
//  context,
//   MaterialPageRoute(
//       builder: (context) => MessagesScreen(),
//       ),
//       ),
//      ),
//      ),
//      ),
//      ],
//      ),






/*
StreamBuilder(
stream: FirebaseFirestore.instance.collection('users').snapshots(),
builder: (ctx, snapshot) {
FirebaseFirestore _firestore = FirebaseFirestore.instance;
String uid = _auth.currentUser!.uid;
_firestore
    .collection('users')
    .doc(uid)
    .collection('rooms')
    .get()
    .then((value) {
setState(() {
String uid = _auth.currentUser!.uid;
for (var n in value.docs) userMap = n.data();

print(userMap);
});
});
String chatRoomId(String user1, String user2) {
if (user1[0].toLowerCase().codeUnits[0] >
user2.toLowerCase().codeUnits[0]) {
return "$user1$user2";
} else {
return "$user2$user1";
}
}

return userMap != null
? ListTile(
onTap: () {
String roomId = chatRoomId(
FirebaseAuth.instance.currentUser!.displayName!,
userMap!['username']);

Navigator.of(context).push(MaterialPageRoute(
builder: (_) => ChatRoom(
chatRoomId: roomId,
userMap: userMap!,
)));
},
leading: CircleAvatar(
radius: 24,
backgroundImage: AssetImage(
userMap!['image_url'],
),
),
title: Text(
userMap!['username'],
style: TextStyle(
color: Colors.black,
fontSize: 17,
fontWeight: FontWeight.w500,
),
),
subtitle: Text(userMap!['email']),
trailing: Icon(Icons.chat, color: Colors.black),
)
    : Container();
});*/
