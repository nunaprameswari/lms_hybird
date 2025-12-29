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
                        MaterialPageRoute(builder: (context) => Profile()),
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
                'assets/images/gmbrpengumuman.png',
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _progressItem(
                    imagePath: 'assets/images/uiux.png',
                    title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                    value: 0.89,
                  ),
                  _progressItem(
                    imagePath: 'assets/images/pkn.png',
                    title: 'KEWARGANEGARAAN',
                    value: 0.86,
                  ),
                  _progressItem(
                    imagePath: 'assets/images/so.png',
                    title: 'SISTEM OPERASI',
                    value: 0.90,
                  ),
                  _progressItem(
                    imagePath: 'assets/images/pmm.png',
                    title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
                    value: 0.90,
                  ),
                  _progressItem(
                    imagePath: 'assets/images/inggris.png',
                    title: 'BAHASA INGGRIS: BUSINESS & SCIENTIFIC',
                    value: 0.90,
                  ),
                  _progressItem(
                    imagePath: 'assets/images/olahraga.png',
                    title: 'OLAH RAGA',
                    value: 0.90,
                  ),
                ],
              ),
            ),
          ],
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

  Widget _progressItem({
    required String imagePath,
    required String title,
    required double value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== IMAGE =====
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // ===== CONTENT =====
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),

                LinearProgressIndicator(
                  value: value,
                  minHeight: 6,
                  color: Color(0xFF0B0547),
                  backgroundColor: Colors.grey.shade300,
                ),

                const SizedBox(height: 4),
                Text(
                  '${(value * 100).toInt()}% Selesai',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
