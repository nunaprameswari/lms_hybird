import 'package:flutter/material.dart';
import 'isiprofile.dart';

class KelasSayaPage extends StatelessWidget {
  final List<Map<String, dynamic>> listKelas = [
    {
      "title": "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]",
      "progress": 0.89,
      "persen": "89 % Selesai",
      "color": Colors.orange,
    },
    {
      "title": "KEWARGANEGARAAN D4SM-41-GAB1 [BBO]. JUMAT 2",
      "progress": 0.86,
      "persen": "86 % Selesai",
      "color": Colors.red,
    },
    {
      "title": "SISTEM OPERASI D4SM-44-02 [DDS]",
      "progress": 0.90,
      "persen": "90 % Selesai",
      "color": Colors.brown,
    },
    {
      "title": "PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA D4SM-41-GAB1 [APJ]",
      "progress": 0.90,
      "persen": "90 % Selesai",
      "color": Colors.cyan,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Kelas Saya",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: listKelas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail Box
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: listKelas[index]["color"].withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(Icons.image, color: listKelas[index]["color"]),
                  ),
                ),
                SizedBox(width: 15),
                // Info Kelas & Progress
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2021/2",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        listKelas[index]["title"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 15),
                      // Custom Progress Bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: listKelas[index]["progress"],
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFB34B4B),
                          ),
                          minHeight: 8,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        listKelas[index]["persen"],
                        style: TextStyle(fontSize: 11, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
