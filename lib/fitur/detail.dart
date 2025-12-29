import 'package:flutter/material.dart';
import 'isiprofile.dart';

class DetailPengumuman extends StatelessWidget {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Maintenance Pra UAS Semester Genap 2020/2021",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                CircleAvatar(radius: 15, backgroundColor: Colors.grey[300]),
                SizedBox(width: 10),
                Text(
                  "By Admin Celoe - Rabu, 2 Juni 2021, 10:45",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Gambar Banner Maintenance
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[50],
              ),
              child: Image.network(
                'https://via.placeholder.com/400x200', // Ganti dengan asset gambar maintenance Anda
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                "Maintenance LMS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).\n\n"
              "Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.\n\n"
              "Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.\n\n"
              "Hormat Kami,\nCeLOE Telkom University",
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
