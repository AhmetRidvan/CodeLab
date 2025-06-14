class Messages {
  int mesaj_kod;
  String mesaj_icerik;

  Messages({required this.mesaj_kod, required this.mesaj_icerik});

  factory Messages.fromJson(Map<String, dynamic> jsonData) {
    return Messages(mesaj_kod: jsonData['mesaj_kod'] as int, mesaj_icerik: jsonData['mesaj_icerik'] as String);
  }
}
