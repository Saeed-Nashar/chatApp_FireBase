

import 'package:flutter/material.dart';
import 'package:project2/components/PrimaryButton.dart';


import '../../constants.dart';
import 'login/login.dart';
import 'registrationScreen/RegistrationScreen.dart';

class SigninOrSignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding
          ),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/icons/ChatAppLight.png"
                    : "assets/icons/chatApp .png",
                height: 146,
              ),
              Text("ChatApp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:  MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.white
                  :Colors.black,),),
              Spacer(),
              PrimaryButton(
                text: "Sign In",
                press: ()  => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Sign Up",
                press: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen()
                      //AuthScreen(),
                    ),
                  );
                },
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}