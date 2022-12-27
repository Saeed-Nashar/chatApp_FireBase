/*


import 'package:flutter/material.dart';

import '../../../constants.dart';



class VideoCalling extends StatefulWidget {
  @override
  _VideoCallingState createState() => _VideoCallingState();
}

class _VideoCallingState extends State<VideoCalling> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "b4b1abc1959e4243937ed039e9e9c958",
      channelName: "abc",
    //  tempToken: "006b4b1abc1959e4243937ed039e9e9c958IABoN5GO8io4fVURpHAoFNWA0Y1FLP7uBBuDPpXsd7O6WMJBJDUAAAAAEACEYx7AlkETYgEAAQCXQRNi",
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('video call'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                //showAVState: true,
                showNumberOfUsers: true,
                disabledVideoWidget: Container(
                  color: Colors.black,
                  height: double.infinity,
                  width: double.infinity,
                  child:Center(child: Text("No user found",style: TextStyle(color: Colors.white),)),
                  // Image.asset("assets/icons/chatApp .png"),
                ),
              ),
              AgoraVideoButtons(
                client: client,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
