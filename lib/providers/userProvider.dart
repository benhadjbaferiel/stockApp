import 'package:flutter/material.dart';

class Userr {
  String username;
  String code;
  bool boolValue;
  bool boolValue1;
  bool boolValue2;
  bool boolValue3;
  bool boolValue4;
  bool boolValue5;
  bool boolValue6;
  bool boolValue7;
  bool boolValue8;
  bool boolValue9;
  bool boolValue10;
  bool boolValue11;
  bool boolValue12;
  bool boolValue13;
  bool boolValue14;
  bool boolValue15;
  bool boolValue16;
  bool boolValue17;
  bool boolValue18;
  bool boolValue19;
  bool boolValue20;
  bool boolValue21;
  bool boolValue22;
  bool boolValue23;
  bool boolValue24;
  bool boolValue25;
  bool boolValue26;
  bool boolValue27;
  bool boolValue28;
  bool boolValue29;
  bool boolValue30;
  bool boolValue31;
  bool boolValue32;
  bool boolValue33;
  bool boolValue34;
  bool boolValue35;
  bool boolValue36;
  bool boolValue37;
  bool boolValue38;
  bool boolValue39;
  bool boolValue40;
  bool boolValue41;
  bool boolValue42;
  bool boolValue43;
  bool boolValue44;
  bool boolValue45;
  bool boolValue46;
  bool boolValue47;
  bool boolValue48;
  bool boolValue49;
  bool boolValue50;
  bool boolValue51;
  bool boolValue52;

  Userr({
    required this.username,
    required this.code,
    required this.boolValue,
    required this.boolValue1,
    required this.boolValue2,
    required this.boolValue3,
    required this.boolValue4,
    required this.boolValue5,
    required this.boolValue6,
    required this.boolValue7,
    required this.boolValue8,
    required this.boolValue9,
    required this.boolValue10,
    required this.boolValue11,
    required this.boolValue12,
    required this.boolValue13,
    required this.boolValue14,
    required this.boolValue15,
    required this.boolValue16,
    required this.boolValue17,
    required this.boolValue18,
    required this.boolValue19,
    required this.boolValue20,
    required this.boolValue21,
    required this.boolValue22,
    required this.boolValue23,
    required this.boolValue24,
    required this.boolValue25,
    required this.boolValue26,
    required this.boolValue27,
    required this.boolValue28,
    required this.boolValue29,
    required this.boolValue30,
    required this.boolValue31,
    required this.boolValue32,
    required this.boolValue33,
    required this.boolValue34,
    required this.boolValue35,
    required this.boolValue36,
    required this.boolValue37,
    required this.boolValue38,
    required this.boolValue39,
    required this.boolValue40,
    required this.boolValue41,
    required this.boolValue42,
    required this.boolValue43,
    required this.boolValue44,
    required this.boolValue45,
    required this.boolValue46,
    required this.boolValue47,
    required this.boolValue48,
    required this.boolValue49,
    required this.boolValue50,
    required this.boolValue51,
    required this.boolValue52,
  });
}

class UserProvider extends ChangeNotifier {
  List<Userr> _users = [];
  List<Userr> get users => _users;

  void addUser(Userr user) {
    _users.add(user);
    notifyListeners();
  }

  void updateUser(int index, Userr user) {
    _users[index] = user;
    notifyListeners();
  }

  void deleteUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }
}
