import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:io' as io;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        user_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT,
        password TEXT,
        user_type TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
    await database.execute("""CREATE TABLE laporan(
        laporan_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        user_id INTEGER NOT NULL,
        user_type TEXT,
        nama_masinis TEXT,
        asisten_masinis TEXT,
        no_lokomotif TEXT,
        jumlah_rangkaian INTEGER,
        jumlah_asd INTEGER,
        statusDeadmanDevice TEXT,
        statusLampuKabinMasinis TEXT,
        statusApar TEXT,
        statusRadioMasinis TEXT,
        statusSulingLokomotif TEXT,
        statusWiper TEXT,
        statusPengukurKecepatan TEXT,
        statusStopblok TEXT,
        statusLokotrack TEXT,
        statusLampuSorot TEXT,
        ketDeadmanDevice TEXT,
        ketLampuKabinMasinis TEXT,
        ketApar TEXT,
        ketRadioMasinis TEXT,
        ketSulingLokomotif TEXT,
        ketWiper TEXT,
        ketPengukurKecepatan TEXT,
        ketStopblok TEXT,
        ketLokotrack TEXT,
        ketLampuSorot TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'gng_apps.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Tambah user baru
  static Future<int> createUser(
      String username, String? password, String user_type) async {
    final db = await SQLHelper.db();

    final data = {
      'username': username,
      'password': password,
      'user_type': user_type,
    };

    final id = await db
        .insert('users', data, conflictAlgorithm: sql.ConflictAlgorithm.replace)
        .then((value) {
      print("User " + username + " berhasil di registrasi");
    });
    return 1;
  }

  // Tambah laporan baru
  static Future<int> createLaporan(
    int user_id,
    String user_type,
    String nama_masinis,
    String asisten_masinis,
    String no_lokomotif,
    int jumlah_rangkaian,
    int jumlah_asd,
    String statusDeadmanDevice,
    String statusLampuKabinMasinis,
    String statusApar,
    String statusRadioMasinis,
    String statusSulingLokomotif,
    String statusWiper,
    String statusPengukurKecepatan,
    String statusStopblok,
    String statusLokotrack,
    String statusLampuSorot,
    String ketDeadmanDevice,
    String ketLampuKabinMasinis,
    String ketApar,
    String ketRadioMasinis,
    String ketSulingLokomotif,
    String ketWiper,
    String ketPengukurKecepatan,
    String ketStopblok,
    String ketLokotrack,
    String ketLampuSorot,
  ) async {
    final db = await SQLHelper.db();

    var data = {
      'user_id': user_id,
      'user_type': user_type,
      'nama_masinis': nama_masinis,
      'asisten_masinis': asisten_masinis,
      'no_lokomotif': no_lokomotif,
      'jumlah_rangkaian': jumlah_rangkaian,
      'jumlah_asd': jumlah_asd,
      'statusDeadmanDevice': statusDeadmanDevice,
      'statusLampuKabinMasinis': statusLampuKabinMasinis,
      'statusApar': statusApar,
      'statusRadioMasinis': statusRadioMasinis,
      'statusSulingLokomotif': statusSulingLokomotif,
      'statusWiper': statusWiper,
      'statusPengukurKecepatan': statusPengukurKecepatan,
      'statusStopblok': statusStopblok,
      'statusLokotrack': statusLokotrack,
      'statusLampuSorot': statusLampuSorot,
      'ketDeadmanDevice': ketDeadmanDevice,
      'ketLampuKabinMasinis': ketLampuKabinMasinis,
      'ketApar': ketApar,
      'ketRadioMasinis': ketRadioMasinis,
      'ketSulingLokomotif': ketSulingLokomotif,
      'ketWiper': ketWiper,
      'ketPengukurKecepatan': ketPengukurKecepatan,
      'ketStopblok': ketStopblok,
      'ketLokotrack': ketLokotrack,
      'ketLampuSorot': ketLampuSorot,
    };

    final id = await db.insert('laporan', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser(
      String username, String userType) async {
    final db = await SQLHelper.db();
    return db.query('users',
        where: "username = ? AND user_type = ?",
        whereArgs: [username, userType],
        limit: 1);
  }
}
