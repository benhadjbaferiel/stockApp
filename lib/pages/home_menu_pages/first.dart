// page 1

import 'package:flutter/material.dart';
import 'home.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(
            255, 228, 225, 168), // Background color for the whole page
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'images/012.png',
                  width: 500,
                  height: 500,
                  // color: Colors.white,
                ),
                const SizedBox(height: 70),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 98, 176, 240),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                home()), // Make sure Home is a valid widget
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                // Add more widgets here if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
