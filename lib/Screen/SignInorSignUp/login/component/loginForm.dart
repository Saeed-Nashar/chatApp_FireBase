
import 'package:flutter/material.dart';
import 'package:project2/Screen/SignInorSignUp/registrationScreen/RegistrationScreen.dart';


import '../../../../constants.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password,
     /* bool islogin, */BuildContext ctx) _submitLogin;
  final bool _isloading;

  const LoginForm(this._submitLogin,this._isloading) ;


  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // form key
  final _formKey = GlobalKey<FormState>();

  bool _isLogin = true;
  String _email = "";
  String _password = "";


  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  // final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  //function
  void _submitLogin(){
    final isValid = _formKey.currentState?.validate() ?? false;
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState?.save();
      widget._submitLogin(_email.trim(), _password.trim(),/* _isLogin, */context);
    }
  }


  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        textCapitalization: TextCapitalization.none,
        autofocus: false,
        controller: emailController,
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
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
       /* validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },*/
        validator: (val){
          if (val == null) {
            return "please enter at least 7 characters";
          }
          else  if (val.isEmpty || val.length < 7) {
            return "please enter at least 7 characters";
          }
          return null;
        },
        onSaved: (val) => _password = val ?? '',
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: kPrimaryColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            _submitLogin();
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor:  MediaQuery.of(context).platformBrightness == Brightness.light?LightTheme:darkTheme,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: MediaQuery.of(context).platformBrightness == Brightness.light?LightTheme:darkTheme,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          MediaQuery.of(context).platformBrightness == Brightness.light
                              ? "assets/icons/ChatAppLight.png"
                              : "assets/icons/chatApp .png",
                          height: 146,

                        )),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    if(widget._isloading)
                      CircularProgressIndicator(),
                    if(!widget._isloading)
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                 // color: kSecondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }}