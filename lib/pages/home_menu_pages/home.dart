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
      // Log des tentatives
      print('Tentative de connexion avec:');
      print('Email: ${email.text.trim()}');
      // print('Mot de passe: ${passcode.text}'); // Avoid logging passwords

      // Attempting login
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: passcode.text,
      );

      print('Connexion réussie avec UID: ${credential.user?.uid}');

      if (credential.user != null) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home2()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Log detailed error information
      print('Erreur de connexion:');
      print('Code: ${e.code}');
      print('Message: ${e.message}');

      // Handle specific error codes
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'Utilisateur non trouvé.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Mot de passe incorrect.';
      } else {
        errorMessage = e.code;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.code),
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
                "Bienvenue sur Modir Pos",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              const SizedBox(height: 20),
              const Text(
                "البريد الإلكتروني",
                style: TextStyle(fontSize: 20, color: Colors.blue),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 228, 225, 168),
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
