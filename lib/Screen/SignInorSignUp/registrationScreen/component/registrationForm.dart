
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'CameraUserPickImgae.dart';


class RegistrationForm extends StatefulWidget {

  final void Function(String email, String password, String username,File image /*bool islogin*/, BuildContext ctx) _submitAuthForm;
  final bool _isloading;

  const RegistrationForm( this._submitAuthForm, this._isloading);
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;


  // our form key
  final _formKey = GlobalKey<FormState>();


  bool _isLogin = true;
  String _email = "";
  String _password = "";
  String _username = "";
  File ?_userImageFile ;
  void _pickedImage(File pickedImage){
    _userImageFile=pickedImage;
  }
   //function
  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    FocusScope.of(context).unfocus();
    if(//!_isLogin &&
        _userImageFile==null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please pick an image."),backgroundColor: Theme.of(context).errorColor,));
      return;
    }
    if (isValid) {
      _formKey.currentState?.save();
      widget._submitAuthForm(
          _email.trim(), _password.trim(), _username.trim(), _userImageFile!/*_isLogin*/, context);

    }
  }

  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final userNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("User Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (val) => _username = val ?? '',
        textInputAction: TextInputAction.next,
       // cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle,//color: kSecondaryColor,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "User Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

        ));

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        autocorrect: false,
        enableSuggestions: false,
        textCapitalization: TextCapitalization.none,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (val) => _email = val ?? '',
       // cursorColor: kSecondaryColor,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail,//color: kSecondaryColor,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (val) {
          if (val == null) {
            return "please enter at least 7 characters";
          }
          else  if (val.isEmpty || val.length < 7) {
            return "please enter at least 7 characters";
          }
          return null;
        },
        onSaved: (val) => _password = val ?? '',
        cursorColor: kSecondaryColor,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key,//color: kSecondaryColor,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: kPrimaryColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            _submit();

          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.light?LightTheme:darkTheme,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:MediaQuery.of(context).platformBrightness == Brightness.light?darkTheme:LightTheme,),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color:MediaQuery.of(context).platformBrightness == Brightness.light?LightTheme:darkTheme,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   /* SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/images/ChatAppLight.png",
                          // fit: BoxFit.contain,
                        )),*/
                   // UserImagePicker(_pickedImage),
                    CameraUserPickImage(imagepickFn:_pickedImage,imagePath:'assets/icons/person.png',),
                    SizedBox(height: 45),
                    emailField,
                    /*SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
                    emailField,*/
                    SizedBox(height: 20),
                    userNameField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    if(widget._isloading)
                      CircularProgressIndicator(),
                    if(!widget._isloading)
                    signUpButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }}
