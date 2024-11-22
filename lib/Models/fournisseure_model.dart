class Fournisseure {
  int? id;
  final String nameF;
  final String addressF;
  final int phoneNumberF;
  final int NIFF;
  final int AIF;
  final int RCF;
  final int NISF;
  final int? categorie_id;

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
        phoneNumberF: map['phoneNumberF'].toInt(),
        NIFF: map['NIFF'].toInt(),
        AIF: map['AIF'].toInt(),
        RCF: map['RCF'].toInt(),
        NISF: map['NISF'].toInt(),
        categorie_id: map['categorie_id'] // Ensure this is always an integer
        );
  }
}
