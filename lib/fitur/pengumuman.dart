import 'package:flutter/material.dart';
import 'detail.dart'; // Import file detail
import 'isiprofile.dart'; // Menggunakan Bottom Nav yang sudah dibuat

class Pengumuman extends StatelessWidget {
  final List<Map<String, String>> listPengumuman = [
    {
      "title": "Maintenance Pra UAS Semester Genap 2020/2021",
      "subtitle": "By Admin Celoe - Rabu, 2 Juni 2021, 10:45",
    },
    {
      "title": "Pengumuman Maintance",
      "subtitle": "By Admin Celoe - Senin, 11 Januari 2021, 7:52",
    },
    {
      "title": "Maintenance Pra UAS Semeter Ganjil 2020/2021",
      "subtitle": "By Admin Celoe - Minggu, 10 Januari 2021, 9:30",
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
        title: Text("Pengumuman", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: listPengumuman.length,
        separatorBuilder: (context, index) =>
            Divider(height: 30, color: Colors.transparent),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPengumuman()),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.campaign,
                  size: 40,
                  color: Colors.black,
                ), // Ikon Megaphone
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listPengumuman[index]["title"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        listPengumuman[index]["subtitle"]!,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar:
          CustomBottomNav(), // Menggunakan widget yang sudah ada
    );
  }
}
