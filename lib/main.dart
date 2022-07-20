import 'package:flutter/material.dart';
import 'package:test_route/pages/laporanMasinis_page.dart';
import 'package:test_route/pages/preLogin_page.dart';
import 'pages/login_page.dart';

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
        '/laporan-masinis': (context) => LaporanMasinis(),
        // laporanMasinis,
        // wiper,
        // lokotrack,
        // apar,
        // lampuKabinMasinis,
        // sulingLokomotif,
        // deadmanDevice,
        // radioMasinis,
        // pengukurKecepatan,
        // lampuSorot,
        // stopBlock
      },
    );
  }
}
