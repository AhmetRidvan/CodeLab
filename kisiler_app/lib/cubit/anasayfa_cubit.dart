import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/entity/kisiler.dart';
import 'package:kisiler_app/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit() : super(<Kisiler>[]);
  var krepo = KisilerDaoRepository();
  final refx = FirebaseDatabase.instance.ref('kisiler');

  Future<void> kisileriYukle() async {
    refx.onValue.listen((event) {
      List<Kisiler> list = [];
      final incomingValues = event.snapshot.value as Map;
      incomingValues.forEach((key, value) {
        final x = Kisiler.fromJson(key, Map<String, dynamic>.from(value));
        list.add(x);
      });
      emit(list);
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    refx.onValue.listen((event) {
      List<Kisiler> list = [];
      final incomingValues = event.snapshot.value as Map;
      incomingValues.forEach((key, value) {
        final x = Kisiler.fromJson(key, Map<String, dynamic>.from(value));
        if (x.kisi_ad.contains(aramaKelimesi)) {
          list.add(x);
        } else {}
      });
      emit(list);
    });
  }

  Future<void> sil(String kisi_id) async {
    await krepo.kisiSil(kisi_id);
    await kisileriYukle();
  }
}
