import 'package:flutter/material.dart';
import 'package:test_route/services/database_helper.dart';
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
  void initState() {
    super.initState();
    _registerUser();
  }

  Future<void> _registerUser() async {
    await SQLHelper.createUser('masinis1', '12345', 'Masinis');
    await SQLHelper.createUser('masinis2', '12345', 'Masinis');
    await SQLHelper.createUser('masinis3', '12345', 'Masinis');
    await SQLHelper.createUser('dipo1', '12345', 'Dipo');
    await SQLHelper.createUser('dipo2', '12345', 'Dipo');
    await SQLHelper.createUser('dipo3', '12345', 'Dipo');

    print("Register done");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
