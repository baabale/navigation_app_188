import 'package:flutter/material.dart';
import 'package:navigation_app/screens/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  String username = '', password = '';

  void login(context) {
    if (username == 'admin' && password == 'pass') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            username: username,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid Username or Password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'Username: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 240,
                  height: 30,
                  child: TextField(
                    onChanged: (newValue) {
                      username = newValue;
                      print(username);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'Password: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 240,
                  height: 30,
                  child: TextField(
                    onChanged: (newValue) {
                      password = newValue;
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 40),
            ),
            onPressed: () => login(context),
          ),
        ],
      ),
    );
  }
}
