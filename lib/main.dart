import 'dart:async';
import 'package:flutter/material.dart';
import 'Login/login.dart';

void main() {
  runApp(
    const MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginLms()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0547),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/image/logohybird.png", width: 180),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
