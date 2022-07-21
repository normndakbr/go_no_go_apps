import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_route/services/sharedPreferences.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import '';

class ItemStopblok extends StatefulWidget {
  const ItemStopblok({Key? key}) : super(key: key);

  @override
  State<ItemStopblok> createState() => _ItemStopblokState();
}

class _ItemStopblokState extends State<ItemStopblok> {
  SharedPreferenceService sharedPref = SharedPreferenceService();
  TextEditingController ketStopblokCtl = TextEditingController();
  bool filled = false;
  bool statusStopblok = false;
  bool yesButton = false;
  bool noButton = false;

  void getPDF() async {
    final pdf = pw.Document();

    // Buat Pages
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Table(
                children: [
                  pw.TableRow(children: [
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text('Data', style: pw.TextStyle(fontSize: 6)),
                          pw.Divider(thickness: 1)
                        ]),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text('Status', style: pw.TextStyle(fontSize: 6)),
                          pw.Divider(thickness: 1)
                        ]),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text('Keterangan',
                              style: pw.TextStyle(fontSize: 6)),
                          pw.Divider(thickness: 1)
                        ]),
                  ]),
                  pw.TableRow(children: [
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text('Wiper', style: pw.TextStyle(fontSize: 6)),
                          pw.Divider(thickness: 1)
                        ]),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text('Berfungsi',
                              style: pw.TextStyle(fontSize: 6)),
                          pw.Divider(thickness: 1)
                        ]),
                  ]),
                ],
              ),
            ); // Center
          }),
    );

    // Simpan
    final bytes = await pdf.save();

    // Buat file kosong di dalam direktori hp
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/output.pdf');

    // Replace file kosong tadi dengan file pdf kita
    await file.writeAsBytes(bytes);

    // Buka file PDF
    await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    void saveData() async {
      await sharedPref.readAllData().then((value) {
        print(value);
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              Image.asset('assets/images/imgLokotrack.png'),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width * 0.75,
                child: Text(
                  'Stopblok',
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
                  controller: ketStopblokCtl,
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
                          statusStopblok = true;
                          filled = true;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/btnTidakBerfungsi.png'),
                      onTap: () async {
                        setState(() {
                          statusStopblok = false;
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
                        if (statusStopblok == true) {
                          print("Stopblok Berfungsi");
                          print("Keterangan : " + ketStopblokCtl.text);
                          await sharedPref
                              .writeData('statusStopblok', 'Berfungsi')
                              .then((value) {
                            saveData();
                            CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                text: "Laporan anda telah berhasil dibuat.",
                                confirmBtnText: 'Simpan',
                                confirmBtnColor: Color(0xFFFB8500),
                                onConfirmBtnTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.of(context)
                                  //     .pushReplacementNamed('/preLogin');
                                  getPDF();
                                });
                          });
                        } else {
                          print("Stopblok Tidak Berfungsi");
                          print("Keterangan : " + ketStopblokCtl.text);
                          await sharedPref
                              .writeData('statusStopblok', 'Tidak Berfungsi')
                              .then((value) async {
                            saveData();
                            CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                text: "Laporan anda telah berhasil dibuat.",
                                confirmBtnText: 'Simpan',
                                confirmBtnColor: Color(0xFFFB8500),
                                onConfirmBtnTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.of(context)
                                  //     .pushReplacementNamed('/preLogin');
                                  getPDF();
                                });
                          });
                        }
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
