import 'package:flutter/material.dart';
import 'tugas.dart';

class MateriPage extends StatelessWidget {
  final String namaKelas;

  const MateriPage({super.key, required this.namaKelas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB34B4B),
        title: Text(namaKelas, style: const TextStyle(fontSize: 14)),
      ),
      body: Column(
        children: [
          // TAB
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Materi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TugasPage()),
                      );
                    },
                    child: const Center(child: Text("Tugas Dan Kuis")),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // LIST MATERI
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                MateriItem(
                  pertemuan: "Pertemuan 1",
                  title: "01 - Pengantar User Interface Design",
                ),
                MateriItem(
                  pertemuan: "Pertemuan 2",
                  title: "02 - Konsep User Interface Design",
                ),
                MateriItem(
                  pertemuan: "Pertemuan 3",
                  title: "03 - Interaksi pada UI Design",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MateriItem extends StatelessWidget {
  final String pertemuan;
  final String title;

  const MateriItem({super.key, required this.pertemuan, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(label: Text(pertemuan)),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
