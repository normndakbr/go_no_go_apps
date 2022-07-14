import 'package:flutter/material.dart';
import 'preLogin_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Text(
          'Login page',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
