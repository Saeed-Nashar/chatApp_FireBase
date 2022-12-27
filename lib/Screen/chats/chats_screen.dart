
import 'package:flutter/material.dart';
import 'components/Status/status_screen.dart';
import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
 
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}


class _ChatsScreenState extends State<ChatsScreen>with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       flexibleSpace: TabBar(
         controller: _controller,
        labelPadding: EdgeInsets.only(bottom: 10),
              indicatorColor: Colors.white,
         tabs: [
           Tab(
             text: "Recent Chats",
           ),
           Tab(
             text: "STATUS",
           ),
           Tab(
             text: "Right partner",
           ),
         ],
       ),
     ),
      body:TabBarView(
        controller: _controller,
        children: [
          Body(),
          StatusPage(),
          Text("Call")
        ],
      ),
    );
  }
}
