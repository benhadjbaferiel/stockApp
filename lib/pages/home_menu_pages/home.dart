import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/home_menu_pages/home2.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key); // Added const constructor

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final TextEditingController email = TextEditingController();
  final TextEditingController passcode = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    email.dispose();
    passcode.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: passcode.text,
      );

      if (credential.user != null) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home2()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "";

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email format.';
      } else {
        errorMessage = 'An error occurred: ${e.message}';
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/7.png',
                width: 500,
                height: 300,
              ),
              const SizedBox(height: 10),
              const Text(
                "Bienvenue sur StockDz",
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 20),
              const Text(
                "البريد الإلكتروني",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      controller: email,
                      keyboardType: TextInputType
                          .emailAddress, // Added email keyboard type
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "كلمة السر",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      controller: passcode,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                child: const Text(
                  "هل نسيت كلمة المرور؟",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  // Add forgot password functionality here
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 176, 171, 86),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    "الدخول",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
