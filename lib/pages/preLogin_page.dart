import 'package:flutter/material.dart';
import 'package:test_route/services/sharedPreferences.dart';
import 'login_page.dart';

class PreLoginPage extends StatefulWidget {
  const PreLoginPage({Key? key}) : super(key: key);

  @override
  State<PreLoginPage> createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLoginPage> {
  SharedPreferenceService sharedPref = SharedPreferenceService();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Container(
              width: width * 0.55,
              child: Text(
                'Halo, Selamat Datang Di Aplikasi Ini',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.09,
            ),
            GestureDetector(
              child: Image.asset('assets/images/btnLoginMasinis.png'),
              onTap: () async {
                print("Login sebagai Masinis");
                await sharedPref.writeData('userType', 'Masinis').then(
                      (value) => {
                        Navigator.pushNamed(
                          context,
                          '/login',
                        )
                      },
                    );
              },
            ),
            SizedBox(
              height: height * 0.09,
            ),
            GestureDetector(
              child: Image.asset('assets/images/btnLoginDipo.png'),
              onTap: () async {
                print("Login sebagai Dipo");
                await sharedPref.writeData('userType', 'Dipo').then(
                      (value) => {
                        Navigator.pushNamed(
                          context,
                          '/login',
                        )
                      },
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
