import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kisiler_app/entity/kisiler.dart';

class KisilerDaoRepository {
  final refx = FirebaseDatabase.instance.ref('kisiler');

  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {
    final map = {'kisi_ad': kisi_ad, 'kisi_id': '', 'kisi_tel': kisi_tel};
    await refx.push().set(map);
  }

  Future<void> kisiGuncelle(
    String kisi_id,
    String kisi_ad,
    String kisi_tel,
  ) async {
    final url = 'http://kasimadalan.pe.hu/kisiler/update_kisiler.php';
    Map<String, dynamic> map = {'kisi_ad': kisi_ad, 'kisi_tel': kisi_tel};
    refx.child(kisi_id).update(map);
  }

  Future<void> kisiSil(String kisi_id) async {
    await refx.child(kisi_id).remove();
  }
}
