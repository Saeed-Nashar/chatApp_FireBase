import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


import '../../../constants.dart';
import '../../TabBar_Screen.dart';
import 'component/registrationForm.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final Auth = FirebaseAuth.instance;
  UserCredential? AuthResult;
  bool _isloading = false;

  void _submitAuthForm(String email, String password, String username,
      File image /*bool islogin*/, BuildContext ctx) async {
    try {
      setState(() {
        _isloading = true;
      });
     // if (!islogin) {
       UserCredential AuthResult = await Auth.createUserWithEmailAndPassword(
          email: email,
          password: password,

        );
             //  AuthResult.user!.updateProfile(displayName: username);
               AuthResult.user!.updateDisplayName(username);
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(AuthResult.user!.uid + '.jpg');

        await ref.putFile(image);

        final url= await ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(AuthResult.user!.uid)
            .set({
          'email':email,
          'username': username,
          'password': password,
          'image_url':url,
          "status": "Unavalible",
          "uid": Auth.currentUser!.uid,
        });
      //}
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>TabBar_Screen()), (route) => false);
    } on FirebaseAuthException catch (e) {
      String message = "error occurred";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
      setState(() {
        _isloading = false;

      });
    }
    catch (e) {
      print(e);
      setState(() {
        _isloading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: RegistrationForm(_submitAuthForm,_isloading),
      ),
    );
  }
}
