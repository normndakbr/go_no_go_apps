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
        child: Column(
          children: [
            Text(
              'Halo, selamat datang di aplikasi ini',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/btnLoginMasinis.png'),
          ],
        ),
      ),
    );
  }
}
