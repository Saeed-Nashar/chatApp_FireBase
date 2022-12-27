import 'package:flutter/material.dart';
class ownMessageCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child:  Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Stack(
            children: [
              Padding(padding: EdgeInsets.only(left: 10,right: 30,top: 5,bottom: 20),
                child: Text("لقد ربحت جائزة مقدمة من صحارى مول في الشارقة ,شارع النهدة يغلق عند الساعة 1:00ص",style: TextStyle(fontSize: 15),),
              ),
              Positioned(
                bottom:0,
                right: 10,
                child: Row(
                  children: [
                    Text("9:58  ",style: TextStyle(fontSize: 13),),
                    SizedBox(width: 5,),
                    Icon(Icons.done_all),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
