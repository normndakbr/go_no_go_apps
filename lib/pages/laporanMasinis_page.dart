import 'package:flutter/material.dart';
import '../services/sharedPreferences.dart';
import 'preLogin_page.dart';

class LaporanMasinis extends StatefulWidget {
  const LaporanMasinis({Key? key}) : super(key: key);

  @override
  State<LaporanMasinis> createState() => _LaporanMasinisState();
}

class _LaporanMasinisState extends State<LaporanMasinis> {
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
      resizeToAvoidBottomInset: false,
      body: Padding(
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
                height: height * 0.06,
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
              Center(
                child: GestureDetector(
                  child: Image.asset('assets/images/btnNext.png'),
                  onTap: () async {
                    print("Masinis : " + masinisCtl.text);
                    print("Asisten Masinis : " + astMasinisCtl.text);
                    print("No. Lokomotif : " + noLokomotifCtl.text);
                    print("Jumlah Rangkaian : " + jmlRangkaianCtl.text);
                    print("Jumlah ASD : " + jmlAsdCtl.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
