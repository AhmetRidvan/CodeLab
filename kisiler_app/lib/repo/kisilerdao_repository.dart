import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kisiler_app/entity/kisiler.dart';
import 'package:kisiler_app/entity/kisiler_cevap.dart';

class KisilerDaoRepository {
  List<Kisiler> parse(String text) {
    return KisilerCevap.fromJson(jsonDecode(text)).list;
  }

  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {}

  Future<void> kisiGuncelle(
    String kisi_id,
    String kisi_ad,
    String kisi_tel,
  ) async {}

  Future<List<Kisiler>> tumKisileriAl() async {
    List<Kisiler> list = [];
    final url = 'http://kasimadalan.pe.hu/kisiler/tum_kisiler.php';
    final res = await Dio().get(url);
    list = parse(res.data);
    return list;
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    final url = 'http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php';
    Map<String, dynamic> map = {'kisi_ad': aramaKelimesi};
    final res = await Dio().post(url, data: FormData.fromMap(map));
    return parse(res.data.toString());
  }

  Future<void> kisiSil(String kisi_id) async {

  } 
}
