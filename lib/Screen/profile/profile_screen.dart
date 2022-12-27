

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/Screen/SignInorSignUp/registrationScreen/component/CameraUserPickImgae.dart';


import '../../constants.dart';
import 'components/ABoutPage.dart';
import 'components/EnteredData.dart';



class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 25,),
          // ProfileWidget(
          //   imagePath:'assets/images/saeed.jpg',
          //   onClicked: () async {},
          // ),
          CameraUserPickImage(imagepickFn: (File pickedImage) =>null, imagePath: 'assets/icons/person.png',),
          const SizedBox(height: 24),
          buildName('saeed Nashar','saeednashar@gmail.com','thinker','0947607648'),
          const SizedBox(height: 24),

        ],
      ),
    );
  }

  Widget buildName(String name,String email,String about,String number) => Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          child: ListTile(
            title: Text(
              'Name',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),
            subtitle:Text(
                    name,
                  style: TextStyle( fontSize:18,color:MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white
                      :Colors.black,),
                       ),
           leading: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            trailing:  Icon(
                      Icons.edit,
            ),
          ),
          onTap: (){
            showModalBottomSheet(
                isScrollControlled: true,
                context: context, builder: (builder)=>EnteredData());
          },
        ),
      ),
      Divider(indent: 80,color: Colors.grey,),
      Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          child: ListTile(
            title: Text(
              'E_mail',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),
            subtitle:Text(
              email,
              style: TextStyle( fontSize:18,color:  MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.white
                  :Colors.black,),
            ),
            leading: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            trailing:  Icon(
              Icons.edit,
            ),
          ),
          onTap: (){
             showModalBottomSheet(
                 isScrollControlled: true,
                 context: context, builder: (builder)=>EnteredData());
          },
        ),
      ),
      Divider(indent: 80,color: Colors.grey,),
      Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          child: ListTile(
            title: Text(
              'About',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),
            subtitle:Text(
              about,
              style: TextStyle( fontSize:18,color: MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.white
                  :Colors.black,),
            ),
            leading: Icon(
              Icons.info_outline,
              color: kPrimaryColor,
            ),
            trailing:  Icon(
              Icons.edit,
            ),
          ),
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (builder)=>AboutPage()));
          },
        ),
      ),
      Divider(indent: 80,color: Colors.grey,),
      Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          child: ListTile(
            title: Text(
              'Phone',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),
            subtitle:Text(
              number,
              style: TextStyle( fontSize:18,color: MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.white
                  :Colors.black,),
            ),
            leading: Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),

    ],
  );

}
