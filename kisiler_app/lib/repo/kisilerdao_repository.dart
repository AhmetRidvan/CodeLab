import 'package:kisiler_app/entity/kisiler.dart';

class KisilerDaoRepository {
  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {}

  Future<void> kisiGuncelle(
    int kisi_id,
    String kisi_ad,
    String kisi_tel,
  ) async {}

  Future<List<Kisiler>> tumKisileriAl() async {
    final list = <Kisiler>[];
    return list;
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    final list = <Kisiler>[];
    return list;
  }

  Future<void> kisiSil(int kisi_id) async {}
}
