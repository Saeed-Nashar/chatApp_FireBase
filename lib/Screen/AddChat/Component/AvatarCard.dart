
import 'package:flutter/material.dart';
import 'package:project2/models/Chat.dart';




class AvatarCard extends StatelessWidget {

  final Chat contact;

  const AvatarCard( this.contact);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage(contact.image),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    backgroundColor:Colors.grey,
                    radius: 11,
                    child: Icon(Icons.clear,color: Colors.white,size: 18,)),
              ),
            ],
          ),
          SizedBox(height: 2,),
          Text(contact.name,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
