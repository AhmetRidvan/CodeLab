import 'package:contacts_app/repo/person_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonUpdateCubit extends Cubit<void> {
  PersonUpdateCubit() : super(0);
  Future<void> update(
    int person_id,
    String person_name,
    String person_number,
  ) async {
    PersonRepo.update(person_id, person_name, person_number);
  }
}
