import 'package:flutter/material.dart';
import '../services/sharedPreferences.dart';
import 'preLogin_page.dart';
import 'package:test_route/services/database_helper.dart';
import 'package:cool_alert/cool_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  TextEditingController userCtl = TextEditingController();
  TextEditingController pwdCtl = TextEditingController();
  final SharedPreferenceService sharedPref = SharedPreferenceService();
  var userType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserType();
  }

  void getUserType() async {
    await sharedPref.readData('userType').then((value) => {
          setState(() {
            userType = value;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(height * 0.05),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: height * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  width: width * 0.9,
                  child: Text(
                    'Silahkan masukkan username & password ' +
                        userType +
                        ' anda untuk melanjutkan',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                TextFormField(
                  controller: userCtl,
                  decoration: InputDecoration(
                    labelText: "Username " + userType,
                    labelStyle: TextStyle(
                      color: Color(0XFF1C2F3D),
                      fontSize: 21,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                TextFormField(
                  controller: pwdCtl,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Color(0XFF1C2F3D),
                      fontSize: 21,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: Colors.black38),
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                userCtl.text != '' && pwdCtl.text != ''
                    ? Center(
                        child: GestureDetector(
                          child: Image.asset('assets/images/btnLogin.png'),
                          onTap: () async {
                            // print("Username : " + userCtl.text);
                            // print("Password : " + pwdCtl.text);

                            // cek ke database tabel user dengan membawa parameter username dan userType
                            final data =
                                await SQLHelper.getUser(userCtl.text, userType);

                            if (data.length == 0) {
                              CoolAlert.show(
                                  context: context,
                                  type: CoolAlertType.error,
                                  text: "Akun tidak ditemukan",
                                  confirmBtnText: 'Coba lagi',
                                  confirmBtnColor: const Color(0xFFFB8500),
                                  onConfirmBtnTap: () {
                                    Navigator.pop(context);
                                  });
                            } else {
                              if (data[0]['username'] != userCtl.text) {
                                CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    text: "Username atau Password salah.",
                                    confirmBtnText: 'Coba lagi',
                                    confirmBtnColor: const Color(0xFFFB8500),
                                    onConfirmBtnTap: () {
                                      Navigator.pop(context);
                                    });
                              } else if (data[0]['username'] == userCtl.text &&
                                  data[0]['password'] != pwdCtl.text) {
                                CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    text: "Username atau Password salah.",
                                    confirmBtnText: 'Coba lagi',
                                    confirmBtnColor: const Color(0xFFFB8500),
                                    onConfirmBtnTap: () {
                                      Navigator.pop(context);
                                    });
                              } else {
                                CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.success,
                                    text:
                                        "Halo, selamat datang " + userCtl.text,
                                    confirmBtnText: 'Buat Laporan',
                                    confirmBtnColor: const Color(0xFFFB8500),
                                    onConfirmBtnTap: () {
                                      if (userType == 'Masinis') {
                                        Navigator.pop(context);
                                        Navigator.pushNamed(
                                            context, '/laporan-masinis');
                                      } else {
                                        Navigator.pop(context);

                                        Navigator.pushNamed(
                                            context, '/item-wiper');
                                      }
                                    });
                              }
                            }
                          },
                        ),
                      )
                    : const SizedBox(
                        width: 0,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
