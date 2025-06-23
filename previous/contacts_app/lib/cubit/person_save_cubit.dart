import 'package:contacts_app/repo/person_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonSaveCubit extends Cubit<void> {
  PersonSaveCubit() : super(0);

  Future<void> save(String person_name, String person_number) async {
    await PersonRepo.save(person_name, person_number);
  }
}
