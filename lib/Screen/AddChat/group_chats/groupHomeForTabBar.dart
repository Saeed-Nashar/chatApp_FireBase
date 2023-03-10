import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../GroupChatRoom.dart';
import 'addMembers.dart';






class GroupHameForTabBar extends StatefulWidget {
  const GroupHameForTabBar({Key? key}) : super(key: key);

  @override
  _GroupHameForTabBarState createState() => _GroupHameForTabBarState();
}

class _GroupHameForTabBarState extends State<GroupHameForTabBar> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;

  List groupList = [];

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
        .collection('groups')
        .get()
        .then((value) {
      setState(() {
        groupList = value.docs;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(

      body: isLoading
          ? Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: groupList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => GroupChatRoom(
                  groupName: groupList[index]['username'],
                  groupChatId: groupList[index]['id'],
                ),
              ),
            ),
            leading: Icon(Icons.group),
            title: Text(groupList[index]['username']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.create,color: Colors.white,),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) =>AddMembersInGroup (),
          ),
        ),
        tooltip: "Create Group",
      ),
    );
  }
}