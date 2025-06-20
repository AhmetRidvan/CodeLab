
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static final String veritabaniAdi = "persons.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if(await databaseExists(veritabaniYolu)){//Veritabanı var mı yok mu kontrolü
      print("Veri tabanı zaten var.Kopyalamaya gerek yok");
    }else{
      //assetten veritabanının alınması
      ByteData data = await rootBundle.load("database/$veritabaniAdi");
      //Veritabanının kopyalama için byte dönüşümü
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      //Veritabanının kopyalanması.
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veri tabanı kopyalandı");
    }
    //Veritabanını açıyoruz.
    return openDatabase(veritabaniYolu);
  }

}



