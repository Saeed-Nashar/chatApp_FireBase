import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:project2/Screen/group/group_screen.dart';


import '../../constants.dart';

/*import 'AddChat/group_chats/groupHomeForTabBar.dart';
import 'AddChat/groupchatHOMEsCREEEN.dart';*/

import 'AddChat/group_chats/groupHomeForTabBar.dart';
import 'Calls/Call.dart';
import 'Search/Search.dart';
import 'chats/chats_screen.dart';


import 'profile/profile_screen.dart';

class TabBar_Screen extends StatefulWidget {

  @override
  _TabBar_ScreenState createState() => _TabBar_ScreenState();
}

class _TabBar_ScreenState extends State<TabBar_Screen> {

  final bool appeer=false;
  final iconList = <IconData>[
    Icons.chat_bubble,
    Icons.group,
    Icons.call,
    Icons.person,
  ];
  late final List<Map<String ,Widget>> pages;
  late final List<Map<String ,String>> title;
  int selectedIndex = 0;
  @override
  void initState() {
    pages=[
      {
        'page':ChatsScreen(),
      },
      {
        'page':
       // GroupScreen(),
        GroupHameForTabBar()
       // GroupScreen(),
      },
      {
        'page':Call(),
      },
      {
        'page':profile(),
      },
    ];
    title=[
      {
        'title':'Chats',
      },
      {
        'title':'Group',
      },
      {
        'title':'Call',
      },
      {
        'title':'Profile',
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>GroupScreen()));
        },
        child:Icon(Icons.add,color: Colors.white,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: buildAppBar(title),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor:  MediaQuery.of(context).platformBrightness == Brightness.dark
            ?  Colors.black12
            : Colors.white,
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        activeColor: kPrimaryColor,
        inactiveColor: MediaQuery.of(context).platformBrightness == Brightness.dark
            ?Colors.grey[800]
            :Colors.grey,
        onTap: (index) => setState(() => selectedIndex = index),
      ),
    );
  }

  AppBar buildAppBar(title) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: Text(title[selectedIndex]['title']),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>search()));
            },
            icon: Icon(Icons.search),
          ),
          PopupMenuButton<String>(
              onSelected: (itemIdentifire) {
                if (itemIdentifire == 'Logout') {
                  FirebaseAuth.instance.signOut();
                }
                if(itemIdentifire=='Setting'){
                }
              }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('Logout'),
                value: 'Logout',
              ),
              PopupMenuItem(
                child: Text('Setting'),
                value: 'Setting',
              ),
            ];
          }
          ),
        ]);
  }
}


