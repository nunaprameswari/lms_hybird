import 'dart:ui';
import 'package:flutter/material.dart';
import 'profile.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  final Color primaryColor = const Color(0xFF0B0547);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ===== Bottom Navigation =====
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== HEADER =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 103, 71, 248), // biru play
                  // borderRadius: BorderRadius.vertical(
                  //   bottom: Radius.circular(20),
                  // ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Hallo,', style: TextStyle(color: Colors.grey)),
                        Text(
                          'DANDY CANDRA PRAITAMA',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                        );
                      },
                      child: Chip(
                        backgroundColor: Color(0xFF0B0547),
                        label: const Text(
                          'MAHASISWA',
                          style: TextStyle(color: Colors.white),
                        ),
                        avatar: const Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===== TUGAS =====
              const Text(
                'Tugas Yang Akan Datang',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              _tugasCard(),

              const SizedBox(height: 20),

              // ===== PENGUMUMAN =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Pengumuman Terakhir',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Lihat Semua', style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/pengumuman.png',
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // ===== PROGRES KELAS =====
              const Text(
                'Progres Kelas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              _progressItem('DESAIN ANTARMUKA & PENGALAMAN PENGGUNA', 0.89),
              _progressItem('KEWARGANEGARAAN', 0.86),
              _progressItem('SISTEM OPERASI', 0.90),
              _progressItem('PEMROGRAMAN MULTIMEDIA INTERAKTIF', 0.90),
              _progressItem('BAHASA INGGRIS: BUSINESS & SCIENTIFIC', 0.90),
              _progressItem('OLAH RAGA', 0.90),

              const SizedBox(
                height: 80,
              ), // ruang agar tidak tertutup bottom nav
            ],
          ),
        ),
      ),
    );
  }

  Widget _tugasCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF0B0547),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          Text(
            'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Tugas 01 – UID Android Mobile Game',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            'Waktu Pengumpulan\nJumat 26 Februari, 23:59 WIB',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _progressItem(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: value,
            color: Color(0xFF0B0547),
            backgroundColor: Colors.grey.shade300,
            minHeight: 6,
          ),
          const SizedBox(height: 4),
          Text(
            '${(value * 100).toInt()}% Selesai',
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
