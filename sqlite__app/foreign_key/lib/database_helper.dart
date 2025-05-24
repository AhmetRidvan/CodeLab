import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static String databaseName = 'filmler.sqlite';

  static Future<Database> accessToDatabase() async {
    String filePath = join(await getDatabasesPath(), databaseName);

    if (await databaseExists(filePath)) {
      print('The database already exists');
    } else {
      ByteData data = await rootBundle.load('database_helper/filmler.sqlite');
      Uint8List byte = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(filePath).writeAsBytes(byte, flush: true);
      print('The database cre.ted');
    }
    return await openDatabase(filePath);
  }
}
