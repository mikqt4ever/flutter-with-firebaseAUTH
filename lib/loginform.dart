import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  String _loginError = '';
  String _signupError = '';

  Future<void> _signIn() async {
    if (_loginFormKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmailController.text,
          password: _loginPasswordController.text,
        );
        // Sign in success, navigate to dashboard or any other screen
        Navigator.pushReplacementNamed(context, '/dashboard');
      } on FirebaseAuthException catch (e) {
        setState(() {
          _loginError = e.message ?? 'An error occurred';
        });
      }
    }
  }

  Future<void> _signUp() async {
    if (_signupFormKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _signupEmailController.text,
          password: _signupPasswordController.text,
        );
        // Sign up success, navigate to dashboard or any other screen
        Navigator.pushReplacementNamed(context, '/dashboard');
      } on FirebaseAuthException catch (e) {
        setState(() {
          _signupError = e.message ?? 'An error occurred';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOW-END',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 23, 214, 166),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Form(
                key: _loginFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _loginEmailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _loginPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: _signIn,
                      icon: Icon(FontAwesomeIcons.signIn),
                      label: Text('Login'),
                    ),
                    if (_loginError.isNotEmpty)
                      Text(
                        _loginError,
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Form(
                key: _signupFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _signupEmailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _signupPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: _signUp,
                      icon: Icon(FontAwesomeIcons.userPlus),
                      label: Text('Sign Up'),
                    ),
                    if (_signupError.isNotEmpty)
                      Text(
                        _signupError,
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
