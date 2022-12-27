
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../../constants.dart';
import '../../TabBar_Screen.dart';
import 'component/loginForm.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Auth = FirebaseAuth.instance;
  UserCredential? AuthResult;
  bool _isloading = false;

  void _submitLogin(String email, String password/*, bool islogin,*/,BuildContext ctx)async{
    try {
      setState(() {
        _isloading = true;
      });
    //  if (islogin) {
        UserCredential AuthResult = await Auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
     // }
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>TabBar_Screen()), (route) => false);
    } on FirebaseAuthException catch (e) {
      String message = "error occurred";
      if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: kErrorColor,
      ));
      setState(() {
        _isloading = false;

      });
    } catch (e) {
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
        body: LoginForm(_submitLogin,_isloading),
      ),
    );
  }
}
