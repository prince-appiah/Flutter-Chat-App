import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/widgets/appbar.dart';
import 'package:flutter_chat_app/widgets/text_field.dart';

class SignIn extends StatefulWidget {
  final Function toggle;

  const SignIn({Key key, @required this.toggle}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Auth _auth = new Auth();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void signIn() {
    print('log in user from here');
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
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: textFieldStyle(),
                            validator: (val) {
                              // TODO: Add regex to check email
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'johndoe@gmail.com',
                              suffixIcon: Icon(
                                Icons.account_box_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            style: textFieldStyle(),
                            validator: (val) {
                              return val.isEmpty || val.length < 4
                                  ? "Please enter password"
                                  : null;
                            },
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
                      onTap: () => signIn(),
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
                          'Sign In',
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
                          'Sign In With Google',
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
                              "Don't have an account? Register Now",
                              style: textFieldStyle().copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //  SizedBox(height: 50),
                  ],
                ),
              ),
            ),
    );
  }
}
