class Yonetmenler {
  String yonetmen_id;
  String yonetmen_ad;

  Yonetmenler(this.yonetmen_id, this.yonetmen_ad);

  factory Yonetmenler.fromJson(Map<String, dynamic> jsonData) {
    return Yonetmenler(jsonData['yonetmen_id'] as String, jsonData['yonetmen_ad'] as String);
  }
}