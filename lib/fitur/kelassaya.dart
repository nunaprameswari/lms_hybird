import 'package:flutter/material.dart';
import 'materi.dart';

class KelasSaya extends StatelessWidget {
  const KelasSaya({super.key});

  static const List<Map<String, dynamic>> listKelas = [
    {
      "title": "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA\nD4SM-42-03 [ADY]",
      "image": "assets/image/uiux.png",
      "progress": 0.89,
    },
    {
      "title": "KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]",
      "image": "assets/image/ppkn.png",
      "progress": 0.86,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelas Saya"),
        backgroundColor: const Color(0xFFB34B4B),
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
                          color: const Color(0xFFB34B4B),
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
