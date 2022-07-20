import 'package:flutter/material.dart';
import '../services/sharedPreferences.dart';
import 'preLogin_page.dart';

class LaporanMasinisPage extends StatefulWidget {
  const LaporanMasinisPage({Key? key}) : super(key: key);

  @override
  State<LaporanMasinisPage> createState() => _LaporanMasinisPageState();
}

class _LaporanMasinisPageState extends State<LaporanMasinisPage> {
  bool hidePassword = true;
  TextEditingController masinisCtl = TextEditingController();
  TextEditingController astMasinisCtl = TextEditingController();
  TextEditingController noLokomotifCtl = TextEditingController();
  TextEditingController jmlRangkaianCtl = TextEditingController();
  TextEditingController jmlAsdCtl = TextEditingController();
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
                  height: height * 0.06,
                ),
                Text(
                  'Laporan Masinis',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: height * 0.048,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  width: width * 0.9,
                  child: Text(
                    'Silahkan lengkapi data berikut terlebih dahulu untuk melanjutkan',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                TextFormField(
                  controller: masinisCtl,
                  decoration: InputDecoration(
                    labelText: "Nama Masinis",
                    labelStyle: TextStyle(
                      color: Color(0XFF1C2F3D),
                      fontSize: height * 0.03,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                TextFormField(
                  controller: astMasinisCtl,
                  decoration: InputDecoration(
                    labelText: "Nama Asisten Masinis",
                    labelStyle: TextStyle(
                      color: Color(0XFF1C2F3D),
                      fontSize: height * 0.03,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                TextFormField(
                  controller: noLokomotifCtl,
                  decoration: InputDecoration(
                    labelText: "Nomor Lokomotif",
                    labelStyle: TextStyle(
                      color: Color(0XFF1C2F3D),
                      fontSize: height * 0.03,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                TextFormField(
                  controller: jmlRangkaianCtl,
                  decoration: InputDecoration(
                    labelText: "Jumlah Rangkaian",
                    labelStyle: TextStyle(
                      color: Color(0XFF1C2F3D),
                      fontSize: height * 0.03,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                TextFormField(
                  controller: jmlAsdCtl,
                  decoration: InputDecoration(
                    labelText: "Jumlah ASD",
                    labelStyle: TextStyle(
                      color: Color(0XFF1C2F3D),
                      fontSize: height * 0.03,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                masinisCtl.text != '' &&
                        astMasinisCtl.text != '' &&
                        noLokomotifCtl.text != '' &&
                        jmlRangkaianCtl.text != '' &&
                        jmlAsdCtl.text != ''
                    ? Center(
                        child: GestureDetector(
                          child: Image.asset('assets/images/btnNext.png'),
                          onTap: () async {
                            print("Masinis : " + masinisCtl.text);
                            print("Asisten Masinis : " + astMasinisCtl.text);
                            print("No. Lokomotif : " + noLokomotifCtl.text);
                            print("Jumlah Rangkaian : " + jmlRangkaianCtl.text);
                            print("Jumlah ASD : " + jmlAsdCtl.text);

                            // var data = {
                            //   'masinis': masinisCtl.text,
                            //   'asisten_masinis': astMasinisCtl.text,
                            //   'no_lokomotif': noLokomotifCtl.text,
                            //   'jumlah_rangkaian': jmlRangkaianCtl.text,
                            //   'jumlah_asd': jmlAsdCtl.text,
                            // };

                            await sharedPref
                                .writeData('masinis', masinisCtl.text)
                                .then((value) async {
                              await sharedPref
                                  .writeData(
                                      'asisten_masinis', astMasinisCtl.text)
                                  .then((value) async {
                                await sharedPref
                                    .writeData(
                                        'no_lokomotif', noLokomotifCtl.text)
                                    .then((value) async {
                                  await sharedPref
                                      .writeData('jumlah_rangkaian',
                                          jmlRangkaianCtl.text)
                                      .then((value) async {
                                    await sharedPref
                                        .writeData('jumlah_asd', jmlAsdCtl.text)
                                        .then((value) {
                                      Navigator.pushNamed(
                                          context, '/item-wiper');
                                    });
                                  });
                                });
                              });
                            });
                          },
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
