class Fournisseure {
  int? id;
  final String nameF;
  final String addressF;
  final int phoneNumberF;
  final int NIFF;
  final int AIF;
  final int RCF;
  final int NISF;
  // final String categorie1;
  final int categorie_id;

  Fournisseure(
      {this.id,
      required this.nameF,
      required this.addressF,
      required this.phoneNumberF,
      required this.NIFF,
      required this.AIF,
      required this.RCF,
      required this.NISF,
      //required this.categorie1,
      required this.categorie_id});
  // Convert to Map for SQLite
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

  // Convert from Map
  factory Fournisseure.fromMap(Map<String, dynamic> map) {
    return Fournisseure(
      id: map['id'],
      nameF: map['nameF'],
      addressF: map['addressF'],
      phoneNumberF: map['phoneNumberF'],
      NIFF: map['NIFF'],
      AIF: map['AIF'],
      RCF: map['RCF'],
      NISF: map['NISF'],
      categorie_id: map['categorie_id'],
    );
  }
}
