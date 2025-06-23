import 'package:contacts_app/model/person_model.dart';
import 'package:contacts_app/repo/person_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonBringCubit extends Cubit<List<PersonModel>> {
  PersonBringCubit() : super(<PersonModel>[]);
  //void çünkü fonksiyonlar değil emit ile göndericez
  Future<void> bringThemAll() async {
    final List = await PersonRepo.showThemAll();
    emit(List);
  }

  Future<void> search(String txt) async {
    final List = await PersonRepo.search(txt);
    emit(List);
  }

  Future<void> delete(int person_id) async {
    await PersonRepo.delete(person_id);
    await bringThemAll();
  }
}
