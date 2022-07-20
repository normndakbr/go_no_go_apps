import 'package:flutter/material.dart';
import 'package:test_route/services/sharedPreferences.dart';
import '../login_page.dart';

class ItemDeadmanDevice extends StatefulWidget {
  const ItemDeadmanDevice({Key? key}) : super(key: key);

  @override
  State<ItemDeadmanDevice> createState() => _ItemDeadmanDeviceState();
}

class _ItemDeadmanDeviceState extends State<ItemDeadmanDevice> {
  SharedPreferenceService sharedPref = SharedPreferenceService();
  TextEditingController ketDeadmanDeviceCtl = TextEditingController();
  bool filled = false;
  bool statusDeadmanDevice = false;
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
              Image.asset('assets/images/imgDeadmanDevice.png'),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width * 0.75,
                child: Text(
                  'DeadmanDevice',
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
                  controller: ketDeadmanDeviceCtl,
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
                          statusDeadmanDevice = true;
                          filled = true;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/btnTidakBerfungsi.png'),
                      onTap: () async {
                        setState(() {
                          statusDeadmanDevice = false;
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
                        if (statusDeadmanDevice == true) {
                          print("DeadmanDevice Berfungsi");
                          print("Keterangan : " + ketDeadmanDeviceCtl.text);
                          await sharedPref.writeData(
                              'statusDeadmanDevice', 'Berfungsi');
                        } else {
                          print("DeadmanDevice Tidak Berfungsi");
                          print("Keterangan : " + ketDeadmanDeviceCtl.text);
                          await sharedPref.writeData(
                              'statusDeadmanDevice', 'Tidak Berfungsi');
                        }

                        Navigator.pushNamed(context, '/item-radio-masinis');
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
