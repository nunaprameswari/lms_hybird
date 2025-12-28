import 'package:flutter/material.dart';
import 'bantuan.dart';
import 'package:lms_hybird/fitur/home.dart';

class LoginLms extends StatefulWidget {
  const LoginLms({super.key});

  @override
  State<LoginLms> createState() => _LoginLmsState();
}

class _LoginLmsState extends State<LoginLms> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ===== Background Image =====
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Image.asset(
              'assets/images/gedunguim.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // ===== Login Card =====
          Positioned.fill(
            top: 220,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),

                    // Logo Bulat
                    Center(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFF0B0547),
                        child: Image.asset(
                          'assets/images/logohybird',
                          width: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Judul
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Email
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email 365',
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF0B0547)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Password
                    TextField(
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF0B0547)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Button Login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0B0547),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Bantuan
                    Center(
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            builder: (context) => const TombolBantuan(),
                          );
                        },
                        child: const Text(
                          'Bantuan ?',
                          style: TextStyle(color: Color(0xFF0B0547)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ===== Wave Bottom =====
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: CustomPaint(painter: WavePainter()),
            ),
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0B0547)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
