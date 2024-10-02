import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/stock_user_pages/user.dart';

class ShowUser extends StatefulWidget {
  const ShowUser({
    super.key,
  });

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة مستخدم"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
