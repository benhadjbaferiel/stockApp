class Clientt {
  final String name;
  final int barcode;
  final String address;
  final int phoneNumber;
  final double Price;
  final int NIF;
  final int AI;
  final int RC;
  final int NIS;
  final int MAX;
  final int DAYS;
  final String categorie;

  Clientt({
    required this.name,
    required this.barcode,
    required this.address,
    required this.phoneNumber,
    required this.Price,
    required this.NIF,
    required this.AI,
    required this.RC,
    required this.NIS,
    required this.MAX,
    required this.DAYS,
    required this.categorie,
  });
  Map<String, dynamic> toMap() {
    return {
      'barcode': barcode,
      'name': name,
      'price': Price,
      'nif': NIF,
      'ai': AI,
      'rc': RC,
      'nis': NIS,
      'phoneNumber': phoneNumber,
      'max': MAX,
      'address': address,
      'category': categorie,
      'days': DAYS,
    };
  }

  factory Clientt.fromMap(Map<String, dynamic> json) {
    return Clientt(
      barcode: json['barcode'] ?? 0,
      name: json['name'] ?? '',
      Price: json['price'] ?? 0.0,
      NIF: json['nif'] ?? 0,
      AI: json['ai'] ?? 0,
      RC: json['rc'] ?? 0,
      NIS: json['nis'] ?? 0,
      phoneNumber: json['phoneNumber'] ?? 0,
      MAX: json['max'] ?? 0,
      address: json['address'] ?? '',
      categorie: json['category'] ?? '',
      DAYS: json['days'] ?? 0,
    );
  }
}
