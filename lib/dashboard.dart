import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              size: 24.0,
            ),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Dashboard!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Logged in as:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              user != null ? user.email ?? '' : '',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // Add your action here
                    print('HTML/CSS clicked');
                  },
                  child: Icon(
                    FontAwesomeIcons.html5,
                    size: 50.0,
                    color: Colors.orange,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Add your action here
                    print('Python clicked');
                  },
                  child: Icon(
                    FontAwesomeIcons.python,
                    size: 50.0,
                    color: Colors.blue,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Add your action here
                    print('JavaScript clicked');
                  },
                  child: Icon(
                    FontAwesomeIcons.js,
                    size: 50.0,
                    color: Colors.yellow,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Add your action here
                    print('Java clicked');
                  },
                  child: Icon(
                    FontAwesomeIcons.java,
                    size: 50.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
