import 'package:flutter/material.dart';
import 'package:test_route/pages/laporanMasinis_page.dart';
import 'package:test_route/pages/preLogin_page.dart';
import 'pages/items/itemApar.dart';
import 'pages/items/itemDeadmanDevice.dart';
import 'pages/items/itemLampuKabinMasinis.dart';
import 'pages/items/itemLampuSorot.dart';
import 'pages/items/itemLokotrack.dart';
import 'pages/items/itemPengukurKecepatan.dart';
import 'pages/items/itemRadioMasinis.dart';
import 'pages/items/itemStopblok.dart';
import 'pages/items/itemSulingLokomotif.dart';
import 'pages/login_page.dart';
import 'package:test_route/pages/items/itemWiper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PreLoginPage(),
      initialRoute: '/preLogin',
      routes: {
        '/preLogin': (context) => PreLoginPage(),
        '/login': (context) => LoginPage(),
        '/laporan-masinis': (context) => LaporanMasinisPage(),
        '/item-wiper': (context) => ItemWiper(),
        '/item-lokotrack': (context) => ItemLokotrack(),
        '/item-apar': (context) => ItemApar(),
        '/item-lampu-kabin-masinis': (context) => ItemLampuKabinMasinis(),
        '/item-suling-lokomotif': (context) => ItemSulingLokomotif(),
        '/item-deadman-device': (context) => ItemDeadmanDevice(),
        '/item-radio-masinis': (context) => ItemRadioMasinis(),
        '/item-pengukur-kecepatan': (context) => ItemPengukurKecepatan(),
        '/item-lampu-sorot': (context) => ItemLampuSorot(),
        '/item-stopblok': (context) => ItemStopblok(),
      },
    );
  }
}
