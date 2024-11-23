class Clientt {
  int? id;
  final String name;
  final int? barcode;
  final String address;
  final int phoneNumber;
  final double Price;
  final int NIF;
  final int AI;
  final int RC;
  final int NIS;
  final int MAX;
  final int DAYS;
  final int? idC;

  Clientt({
    this.id,
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
    required this.idC,
  });
  Map<String, dynamic> toMap() {
  return {
    'barcode': barcode ?? 0, // Default value if null
    'name': name,
    'price': Price ?? 0.0,  // Default value if null
    'address': address,
    'phoneNumber': phoneNumber,
    'nif': NIF,
    'ai': AI,
    'rc': RC,
    'nis': NIS,
    'max': MAX,
    'days': DAYS,
    'idC': idC,
  };
}


  factory Clientt.fromMap(Map<String, dynamic> map) {
  return Clientt(
    id: map['id'], // Assuming 'id' is nullable
    barcode: map['barcode'] != null ? (map['barcode'] as num).toInt() : null,
    name: map['name'] ?? '',
    Price: map['price'] != null ? (map['price'] as num).toDouble() : 0.0,
    NIF: map['nif'] != null ? (map['nif'] as num).toInt() : 0,
    AI: map['ai'] != null ? (map['ai'] as num).toInt() : 0,
    RC: map['rc'] != null ? (map['rc'] as num).toInt() : 0,
    NIS: map['nis'] != null ? (map['nis'] as num).toInt() : 0,
    phoneNumber: map['phoneNumber'] != null ? (map['phoneNumber'] as num).toInt() : 0,
    MAX: map['max'] != null ? (map['max'] as num).toInt() : 0,
    address: map['address'] ?? '',
    DAYS: map['days'] != null ? (map['days'] as num).toInt() : 0,
    idC: map['idC'], // Assuming idC can be nullable
  );
}
}
