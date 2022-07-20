import 'package:flutter/material.dart';
import 'package:test_route/services/sharedPreferences.dart';
import '../login_page.dart';

class ItemWiper extends StatefulWidget {
  const ItemWiper({Key? key}) : super(key: key);

  @override
  State<ItemWiper> createState() => _ItemWiperState();
}

class _ItemWiperState extends State<ItemWiper> {
  SharedPreferenceService sharedPref = SharedPreferenceService();
  TextEditingController ketWiperCtl = TextEditingController();
  bool filled = false;
  bool statusWiper = false;
  bool yesButton = false;
  bool noButton = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              Container(
                width: width * 0.75,
                child: Text(
                  'Pengecekan Go No Go Item Kereta Api',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.041,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Image.asset('assets/images/imgWiper.png'),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width * 0.75,
                child: Text(
                  'Wiper',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height * 0.041,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: ketWiperCtl,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black54),
                    ),
                    labelText: "Keterangan",
                    labelStyle: TextStyle(
                      color: Color(0XFF1C2F3D),
                      fontSize: height * 0.03,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Image.asset('assets/images/btnBerfungsi.png'),
                      onTap: () {
                        setState(() {
                          statusWiper = true;
                          filled = true;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/btnTidakBerfungsi.png'),
                      onTap: () async {
                        setState(() {
                          statusWiper = false;
                          filled = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              filled
                  ? GestureDetector(
                      child: Image.asset('assets/images/btnNext.png'),
                      onTap: () async {
                        if (statusWiper == true) {
                          print("Wiper Berfungsi");
                          print("Keterangan : " + ketWiperCtl.text);
                        } else {
                          print("Wiper Tidak Berfungsi");
                          print("Keterangan : " + ketWiperCtl.text);
                        }

                        await sharedPref.writeData('statusWiper', 'Berfungsi');
                        // Navigator.pushNamed(context, '/preLogin');
                      },
                    )
                  : SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}