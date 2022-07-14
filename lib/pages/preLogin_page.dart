import 'package:flutter/material.dart';
import 'login_page.dart';

class PreLoginPage extends StatelessWidget {
  const PreLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre Login Page'),
      ),
      body: Center(
        child: Text(
          'Pre Login page',
          style: TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LoginPage();
          }));
        },
      ),
    );
  }
}
