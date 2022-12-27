import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Welcome/WelcomeScreen.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chat"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: InkWell(
                child: Row(
                  children: [
                    Text("logout",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                    Icon(Icons.logout),
                  ],
                ),
                onTap: (){
                            FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>WelcomeScreen()), (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
