import 'package:flutter/material.dart';
import 'package:lms_hybird/fitur/profile.dart';
import 'pengumuman.dart';
import 'kelassaya.dart';
import 'notifikasi.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _selectedIndex = 0;

  final Color primaryColor = const Color(0xFF0B0547);

  final List<Widget> _pages = [
    HomePage(), // isi home (kode kamu)
    const KelasSaya(), // halaman kelas
    const Notifikasi(), // halaman notifikasi
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      backgroundColor: Colors.white,

      // ===== Bottom Navigation =====
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Header =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 59, 48, 223), // biru play
                // borderRadius: BorderRadius.vertical(
                // bottom: Radius.circular(20),
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                      // backgroundColor: primaryColor,
                      label: const Text(
                        'MAHASISWA',
                        style: TextStyle(color: Color(0xFF0B0547)),
                      ),
                      avatar: const Icon(
                        Icons.person,
                        color: Color(0xFF0B0547),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Tugas =====
            const Text(
              'Tugas Yang Akan Datang',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
            ),

            const SizedBox(height: 20),

            // ===== Pengumuman =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pengumuman Terakhir',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Pengumuman(), // Sesuaikan dengan nama class di pengumuman.dart
                      ),
                    );
                  },
                  child: Text(
                    'Lihat Semua',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/image/gmbrpengumuman.png',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // ===== Progres Kelas =====
            const Text(
              'Progres Kelas',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _progressItem(
              imagePath: 'assets/image/uiux.png',
              title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
              value: 0.89,
            ),
            _progressItem(
              imagePath: 'assets/image/ppkn.png',
              title: 'KEWARGANEGARAAN',
              value: 0.86,
            ),
            _progressItem(
              imagePath: 'assets/image/system.png',
              title: 'SISTEM OPERASI',
              value: 0.90,
            ),
            _progressItem(
              imagePath: 'assets/image/pemrograman.png',
              title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
              value: 0.90,
            ),
            _progressItem(
              imagePath: 'assets/image/bhsinggris.png',
              title: 'BAHASA INGGRIS: BUSINESS & SCIENTIFIC',
              value: 0.90,
            ),
            _progressItem(
              imagePath: 'assets/image/multimedia.png',
              title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
              value: 0.90,
            ),
            _progressItem(
              imagePath: 'assets/image/olahraga.png',
              title: 'OLAH RAGA\nD3TT-44-02 [EYR]',
              value: 0.90,
            ),
            const SizedBox(height: 80),
          ],
        ),
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
