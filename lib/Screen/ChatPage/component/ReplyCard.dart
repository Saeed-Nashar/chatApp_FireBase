import 'package:flutter/material.dart';
class ReplyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child:  Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Stack(
            children: [
              Padding(padding: EdgeInsets.only(left: 10,right: 60,top: 5,bottom: 20),
                child: Text("شكرا لكم على مصداقيتكم",style: TextStyle(fontSize: 15),),
              ),
              Positioned(
                bottom:0,
                right: 10,
                child:
                Text("10:30 م",style: TextStyle(fontSize: 13),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
