import 'package:flutter/material.dart';
import 'package:flutter_chat_app/helpers/local_shared_preferences.dart';
import 'package:flutter_chat_app/screens/chat_room.dart';
import 'package:flutter_chat_app/services/database.dart';

import '../services/auth.dart';
import '../widgets/appbar.dart';
import '../widgets/text_field.dart';

class SignUp extends StatefulWidget {
  final Function toggle;

  const SignUp({Key key, @required this.toggle}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Auth _auth = new Auth();
  Database _database = new Database();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void signUp() {
    if (_formKey.currentState.validate()) {
      // TODO: Move toMap function in user model
      Map<String, dynamic> userToMap = {
        "username": _usernameController.text,
        "email": _emailController.text
      };

      LocalSharedPreferences.saveLoggedInUsername(_emailController.text);
      LocalSharedPreferences.saveLoggedInUserEmail(_usernameController.text);

      setState(() => isLoading = true);

      _auth
          .signUpWithEmailAndPassword(
              _emailController.text, _passwordController.text)
          .then((val) {
        print(val);

        _database.createUser(userToMap);
        LocalSharedPreferences.loggedInUserSaved(true);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: EdgeInsets.only(top: 100.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _usernameController,
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              return val.isEmpty || val.length < 4
                                  ? "Please enter username"
                                  : null;
                            },
                            style: textFieldStyle(),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'username1234',
                              suffixIcon: Icon(
                                Icons.account_box_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              // TODO: Add regex to check email
                              return null;
                            },
                            style: textFieldStyle(),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'johndoe@gmail.com',
                              suffixIcon: Icon(
                                Icons.email_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (val) {
                              return val.isEmpty || val.length < 4
                                  ? "Please enter password"
                                  : null;
                            },
                            style: textFieldStyle(),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: '*********',
                              suffixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child:
                              Text('Forgot Password?', style: textFieldStyle()),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () => signUp(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[500], Colors.green[500]],
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          'Sign Up',
                          style: textFieldStyle(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          'Sign Up With Google',
                          style: textFieldStyle().copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => widget.toggle(),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Already registered? Sign In now",
                              style: textFieldStyle().copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
//                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
    );
  }
}
