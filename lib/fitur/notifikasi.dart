import 'package:flutter/material.dart';
// import 'isiprofile.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  static const List<Map<String, dynamic>> listNotifikasi = [
    {
      "icon": Icons.description_outlined,
      "pesan":
          "Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)",
      "waktu": "3 Hari 9 Jam Yang Lalu",
    },
    {
      "icon": Icons.quiz_outlined,
      "pesan":
          "Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)",
      "waktu": "3 Hari 9 Jam Yang Lalu",
    },
    {
      "icon": Icons.description_outlined,
      "pesan":
          "Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)",
      "waktu": "3 Hari 9 Jam Yang Lalu",
    },
    {
      "icon": Icons.quiz_outlined,
      "pesan":
          "Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)",
      "waktu": "3 Hari 9 Jam Yang Lalu",
    },
    {
      "icon": Icons.description_outlined,
      "pesan":
          "Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)",
      "waktu": "3 Hari 9 Jam Yang Lalu",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: Notifikasi.listNotifikasi.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Notifikasi.listNotifikasi[index]["icon"], size: 30),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Notifikasi.listNotifikasi[index]["pesan"],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      Notifikasi.listNotifikasi[index]["waktu"],
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
