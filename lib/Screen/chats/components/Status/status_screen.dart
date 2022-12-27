import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../constants.dart';
import 'components/HeadonStatus.dart';
import 'components/otherStatus.dart';



class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource src) async {
    final pickedImageFile =
    await _picker.pickImage(source: src);
    setState(() {
      if (pickedImageFile != null){
        _pickedImage = File(pickedImageFile.path);

      } else {
        print("No Image selected");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(Icons.edit, color: Colors.blueGrey[900],),
            ),
          ),
          SizedBox(height: 13,),
          FloatingActionButton(
            onPressed: () {
              var ad = AlertDialog(
                title: Text(
                  "Choose picture from:",
                  style: TextStyle(),
                ),
                content: Container(
                  height: 150,
                  child: Column(
                    children: [
                      Divider(color: Colors.grey),
                      Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.image,
                            color: kPrimaryColor,
                          ),
                          title: Text(
                            "Gallery",
                            style:  Theme.of(context).textTheme.subtitle2,
                          ),
                          onTap: () {
                            _pickImage(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.camera_alt,
                            color: kPrimaryColor,
                          ),
                          title: Text(
                            "Camera",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          onTap: () {
                            _pickImage(ImageSource.camera);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
              showDialog(context: context, builder: (builder) => ad);
            },
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.camera_alt,color: Colors.white,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   SizedBox(height: 10,),
            HeadOwnStatus(),
            label("Recent updates"),
            OtherStatus(
              name: "Jacob Jones",
              time: "0.1:30",
              imageName: "assets/images/user_4.png",
              isSeen: false,
              statusNum: 2,
            ),
            OtherStatus(
              name: "Albert Flores",
              time: "5:30",
              imageName: "assets/images/user_5.png",
              isSeen: false,
              statusNum: 1,
            ),
            SizedBox(height: 10,),
            label("Viewed updates"),
            OtherStatus(
              name: "Jenny Wilson",
              time: "0.1:30",
              imageName: "assets/images/user_3.png",
              isSeen: true,
              statusNum: 3,
            ),
            OtherStatus(
              name: "Esther Howard",
              time: "5:30",
              imageName: "assets/images/user_2.png",
              isSeen: true,
              statusNum: 10,
            ),
          ],
        ),
      ),
    );
  }


  Widget label( String lebalName) {
    return Container(
      height: 20,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color:MediaQuery.of(context).platformBrightness == Brightness.dark
          ? Colors.black12
          :Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 1),
        child: Text(lebalName,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: kPrimaryColor),),
      ),
    );

  }
}