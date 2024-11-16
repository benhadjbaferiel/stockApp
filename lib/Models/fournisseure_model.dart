class Fournisseure {
  int? id;
  final String nameF;
  final String addressF;
  final int phoneNumberF;
  final int NIFF;
  final int AIF;
  final int RCF;
  final int NISF;
  final int categorie_id;

  Fournisseure({
    this.id,
    required this.nameF,
    required this.addressF,
    required this.phoneNumberF,
    required this.NIFF,
    required this.AIF,
    required this.RCF,
    required this.NISF,
    required this.categorie_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'nameF': nameF,
      'addressF': addressF,
      'phoneNumberF': phoneNumberF,
      'NIFF': NIFF,
      'AIF': AIF,
      'RCF': RCF,
      'NISF': NISF,
      'categorie_id': categorie_id,
    };
  }

  factory Fournisseure.fromMap(Map<String, dynamic> map) {
    return Fournisseure(
      id: map['id'],
      nameF: map['nameF'],
      addressF: map['addressF'],
      phoneNumberF: (map['phoneNumberF'] is double)
          ? map['phoneNumberF'].toInt()
          : map['phoneNumberF'],
      NIFF: (map['NIFF'] is double) ? map['NIFF'].toInt() : map['NIFF'],
      AIF: (map['AIF'] is double) ? map['AIF'].toInt() : map['AIF'],
      RCF: (map['RCF'] is double) ? map['RCF'].toInt() : map['RCF'],
      NISF: (map['NISF'] is double) ? map['NISF'].toInt() : map['NISF'],
      categorie_id: (map['categorie_id'] is double)
          ? map['categorie_id'].toInt()
          : map['categorie_id'],
    );
  }

  String get category {
    return 'Category $categorie_id';
  }
}
