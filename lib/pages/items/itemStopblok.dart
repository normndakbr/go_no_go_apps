import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_route/services/sharedPreferences.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

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
  var newData;
  var now = DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  void getPDF() async {
    final pdf = pw.Document();
    String formattedDate = formatter.format(now);

    // Buat Pages
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Container(
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 20),
                    pw.Center(
                      child: pw.Text(
                        'Laporan Hasil Pemeriksaan',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 20),
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    newData['userType'] == 'Masinis'
                        ? pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                                pw.Text(
                                  'Username : ' +
                                      newData['username'].toString(),
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Tipe Akun : ' +
                                      newData['userType'].toString(),
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Tanggal Laporan : ' + formattedDate,
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Masinis : ' + newData['masinis'],
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Asisten Masinis : ' +
                                      newData['asisten_masinis'],
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Nomor Lokomotif : ' +
                                      newData['no_lokomotif'],
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Jumlah Rangkaian : ' +
                                      newData['jumlah_rangkaian'],
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Jumlah HSD : ' + newData['jumlah_asd'],
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                              ])
                        : pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                                pw.Text(
                                  'Username : ' +
                                      newData['username'].toString(),
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Tipe Akun : ' +
                                      newData['userType'].toString(),
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'Tanggal Laporan : ' + formattedDate,
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                              ]),
                    pw.SizedBox(height: 30),
                    pw.Center(
                      child: pw.Table(
                        children: [
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Data',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 2.5)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Status',
                                      style: pw.TextStyle(
                                        fontSize: 12,
                                      )),
                                  pw.Divider(thickness: 2.5)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Keterangan',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 2.5)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Wiper',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['statusWiper'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['ketWiper'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Lokotrack',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['statusLokotrack'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['ketLokotrack'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Apar',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['statusApar'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['ketApar'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Lampu Kabin Masinis',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['statusLampuKabinMasinis']
                                          .toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['ketLampuKabinMasinis']
                                          .toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Suling Lokomotif',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['statusSulingLokomotif']
                                          .toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['ketSulingLokomotif'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Deadman Device',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['statusDeadmanDevice'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['ketDeadmanDevice'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Radio Masinis',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['statusRadioMasinis'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['ketRadioMasinis'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Pengukur Kecepatan',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['statusPengukurKecepatan']
                                          .toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['ketPengukurKecepatan']
                                          .toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                                                    pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Lampu Sorot',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['statusLampuSorot']
                                          .toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                      newData['ketLampuSorot'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                          pw.TableRow(children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text('Stopblok',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['statusStopblok'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(newData['ketStopblok'].toString(),
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Divider(thickness: 1)
                                ]),
                          ]),
                        ],
                      ),
                    ),
                  ]),
            ); // Center
          }),
    );

    // Simpan
    final bytes = await pdf.save();

    // Buat file kosong di dalam direktori hp
    final dir = await getApplicationDocumentsDirectory();
    final file =
        File('${dir.path}/laporan_${newData['userType']}_${formattedDate}.pdf');

    // Replace file kosong tadi dengan file pdf kita
    await file.writeAsBytes(bytes);

    // Buka file PDF
    await OpenFile.open(file.path);
  }

  void getAllData() async {
    await sharedPref.readAllData().then((value) {
      if (value['userType'] == 'Masinis') {
        setState(() {
          newData = {
            'username': value['username'],
            'userType': value['userType'],
            'masinis': value['masinis'],
            'asisten_masinis': value['asisten_masinis'],
            'no_lokomotif': value['no_lokomotif'],
            'jumlah_rangkaian': value['jumlah_rangkaian'],
            'jumlah_asd': value['jumlah_asd'],
            'statusWiper': value['statusWiper'],
            'ketWiper': value['ketWiper'],
            'statusLokotrack': value['statusLokotrack'],
            'ketLokotrack': value['ketLokotrack'],
            'statusApar': value['statusApar'],
            'ketApar': value['ketApar'],
            'statusLampuKabinMasinis': value['statusLampuKabinMasinis'],
            'ketLampuKabinMasinis': value['ketLampuKabinMasinis'],
            'statusSulingLokomotif': value['statusSulingLokomotif'],
            'ketSulingLokomotif': value['ketSulingLokomotif'],
            'statusDeadmanDevice': value['statusDeadmanDevice'],
            'ketDeadmanDevice': value['ketDeadmanDevice'],
            'statusRadioMasinis': value['statusRadioMasinis'],
            'ketRadioMasinis': value['ketRadioMasinis'],
            'statusPengukurKecepatan': value['statusPengukurKecepatan'],
            'ketPengukurKecepatan': value['ketPengukurKecepatan'],
            'statusLampuSorot': value['statusLampuSorot'],
            'ketLampuSorot': value['ketLampuSorot'],
            'statusStopblok': value['statusStopblok'],
            'ketStopblok': value['ketStopblok']
          };
        });
      } else if (value['userType'] == 'Dipo') {
        setState(() {
          newData = {
            'username': value['usename'],
            'userType': value['userType'],
            'statusWiper': value['statusWiper'],
            'ketWiper': value['ketWiper'],
            'statusLokotrack': value['statusLokotrack'],
            'ketLokotrack': value['ketLokotrack'],
            'statusApar': value['statusApar'],
            'ketApar': value['ketApar'],
            'statusLampuKabinMasinis': value['statusLampuKabinMasinis'],
            'ketLampuKabinMasinis': value['ketLampuKabinMasinis'],
            'statusSulingLokomotif': value['statusSulingLokomotif'],
            'ketSulingLokomotif': value['ketSulingLokomotif'],
            'statusDeadmanDevice': value['statusDeadmanDevice'],
            'ketDeadmanDevice': value['ketDeadmanDevice'],
            'statusRadioMasinis': value['statusRadioMasinis'],
            'ketRadioMasinis': value['ketRadioMasinis'],
            'statusPengukurKecepatan': value['statusPengukurKecepatan'],
            'ketPengukurKecepatan': value['ketPengukurKecepatan'],
            'statusLampuSorot': value['statusLampuSorot'],
            'ketLampuSorot': value['ketLampuSorot'],
            'statusStopblok': value['statusStopblok'],
            'ketStopblok': value['ketStopblok']
          };
        });
      }
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
                        await sharedPref.writeData(
                            'ketStopblok',
                            ketStopblokCtl.text == ''
                                ? '-'
                                : ketStopblokCtl.text);

                        if (statusStopblok == true) {
                          await sharedPref
                              .writeData('statusStopblok', 'Berfungsi')
                              .then((value) {
                            getAllData();
                            CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                text: "Laporan anda telah berhasil dibuat.",
                                confirmBtnText: 'Simpan',
                                confirmBtnColor: Color(0xFFFB8500),
                                onConfirmBtnTap: () {
                                  getPDF();
                                  Navigator.pop(context);
                                  Navigator.of(context)
                                      .pushReplacementNamed('/preLogin');
                                });
                          });
                        } else {
                          await sharedPref
                              .writeData('statusStopblok', 'Tidak Berfungsi')
                              .then((value) async {
                            getAllData();
                            CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                text: "Laporan anda telah berhasil dibuat.",
                                confirmBtnText: 'Simpan',
                                confirmBtnColor: Color(0xFFFB8500),
                                onConfirmBtnTap: () {
                                  getPDF();
                                  Navigator.pop(context);
                                  Navigator.of(context)
                                      .pushReplacementNamed('/preLogin');
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
