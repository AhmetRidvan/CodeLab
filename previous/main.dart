void main() {

  var kisi = Kisi(id: 1, name: 'Ahmet', age: 25);
  var okul = School(school_id: 1,school_name: 'Recep tayip okulu');
  Map<String,dynamic> mapHali = okul.toMap();


  Map<String, dynamic> kisiMap = kisi.toMap();


  print(mapHali);
}

class Kisi {
  int id;
  String name;
  int age;

  Kisi({required this.id, required this.name, required this.age});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,

    };
  }
}

class School{
  int school_id;
  String school_name;
  
  School({required this.school_id,required this.school_name});
  
  toMap(){
    return {
      'school_id' : school_id,
      'school_name' : school_name,
    };
  }
}
