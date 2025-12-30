import 'package:flutter/material.dart';
import 'materi.dart';

class KelasSaya extends StatelessWidget {
  const KelasSaya({super.key});

  static const List<Map<String, dynamic>> listKelas = [
    {
      "title": "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
      "image": "assets/image/uiux.png",
      "progress": 0.89,
    },
    {
      "title": "KEWARGANEGARAAN",
      "image": "assets/image/ppkn.png",
      "progress": 0.86,
    },
    {
      "title": "SISTEM OPERASI",
      "image": "assets/image/system.png",
      "progress": 0.90,
    },
    {
      "title": "PEMROGRAMAN MULTIMEDIA INTERAKTIF",
      "image": "assets/image/pemrograman.png",
      "progress": 0.90,
    },
    {
      "title": "BAHASA INGGRIS: BUSINESS & SCIENTIFIC",
      "image": "assets/image/bhsinggris.png",
      "progress": 0.90,
    },
    {
      "title": "PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]",
      "image": "assets/image/multimedia.png",
      "progress": 0.90,
    },
    {
      "title": "OLAH RAGA\nD3TT-44-02 [EYR]",
      "image": "assets/image/olahraga.png",
      "progress": 0.90,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelas Saya", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0B0547),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: listKelas.length,
        itemBuilder: (context, index) {
          final kelas = listKelas[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MateriPage(namaKelas: kelas["title"]),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  // IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      kelas["image"],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // INFO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kelas["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: kelas["progress"],
                          color: const Color(0xFF0B0547),
                          backgroundColor: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${(kelas["progress"] * 100).toInt()}% Selesai",
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
