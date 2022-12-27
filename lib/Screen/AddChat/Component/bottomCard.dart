import 'package:flutter/material.dart';

class buttomCard extends StatelessWidget {
  final String name;
  final IconData icon;

  const buttomCard({ required this.name, required this.icon}) ;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(icon,color: Colors.white,),
        backgroundColor: Color(0xFF25D366),
      ),
      title: Text(name,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
    );
  }
}
