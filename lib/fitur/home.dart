import 'dart:ui';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Header =====
              Row(
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
                  Chip(
                    backgroundColor: primaryColor,
                    label: const Text(
                      'MAHASISWA',
                      style: TextStyle(color: Colors.white),
                    ),
                    avatar: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
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
                  color: const Color(0xFF0B0547),
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

              // ===== Progres Kelas =====
              const Text(
                'Progres Kelas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              _progressItem(
                'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                '89% Selesai',
                0.89,
              ),
              _progressItem('KEWARGANEGARAAN', '86% Selesai', 0.86),
              _progressItem('SISTEM OPERASI', '90% Selesai', 0.90),
            ],
          ),
        ),
      ),
    );
  }

  Widget _progressItem(String title, String subtitle, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
          Text(subtitle, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
