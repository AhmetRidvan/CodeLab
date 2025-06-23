import 'package:contacts_app/model/person_model.dart';

class PersonRepo {
  static Future<void> save(String person_name, String person_number) async {
    print('$person_name $person_number');
  }

  static Future<void> update(
    int person_id,
    String person_name,
    String person_number,
  ) async {
    print('$person_id $person_name $person_number');
  }

  static Future<List<PersonModel>> showThemAll() async {
    final list = <PersonModel>[];
    final p1 = PersonModel(
      person_id: 1,
      person_name: 'Samet',
      person_number: '2456764543',
    );
    final p2 = PersonModel(
      person_id: 2,
      person_name: 'Ada',
      person_number: '698765245',
    );
    final p3 = PersonModel(
      person_id: 3,
      person_name: 'Ashe',
      person_number: '213654321',
    );
    list.addAll([p1, p2, p3]);
    return list;
  }

  static Future<List<PersonModel>> search(String text) async {
    final list = <PersonModel>[];
    final p1 = PersonModel(
      person_id: 1,
      person_name: 'Samet',
      person_number: '2456764543',
    );

    list.addAll([p1]);
    return list;
  }

  static Future<void> delete(int person_id) async {
    print(person_id);
  }
}
