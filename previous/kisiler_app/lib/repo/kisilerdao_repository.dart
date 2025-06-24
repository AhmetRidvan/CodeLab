import 'package:kisiler_app/entity/kisiler.dart';
import 'package:kisiler_app/veritabani_yardimcisi.dart';

class KisilerDaoRepository {
  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    Map<String, dynamic> map = {};
    map['kisi_ad'] = kisi_ad;
    map['kisi_tel'] = kisi_tel;
    db.insert('kisiler', map);
  }

  Future<void> kisiGuncelle(
    int kisi_id,
    String kisi_ad,
    String kisi_tel,
  ) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    Map<String, dynamic> map = {};
    map['kisi_ad'] = kisi_ad;
    map['kisi_tel'] = kisi_tel;
    db.update('kisiler', map, where: 'kisi_id =?', whereArgs: [kisi_id]);
  }

  Future<List<Kisiler>> tumKisileriAl() async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM kisiler',
    );
    return maps.map((e) {
      return Kisiler(
        kisi_id: e['kisi_id'],
        kisi_ad: e['kisi_ad'],
        kisi_tel: e['kisi_tel'],
      );
    }).toList();
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM kisiler WHERE kisi_ad LIKE "%$aramaKelimesi%"',
    );
    return maps.map((e) {
      return Kisiler(
        kisi_id: e['kisi_id'],
        kisi_ad: e['kisi_ad'],
        kisi_tel: e['kisi_tel'],
      );
    }).toList();
  }

  Future<void> kisiSil(int kisi_id) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete('kisiler', where: 'kisi_id =?', whereArgs: [kisi_id]);
  }
}
