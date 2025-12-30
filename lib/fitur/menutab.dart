import 'package:flutter/material.dart';

// --- TAB ABOUT ME ---
class AboutMeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      children: [
        Text(
          "Informasi User",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 10),
        _infoTile("Email address", "nindiprameswariputricahyono@uim.ac.id"),
        _infoTile("Program Studi", "S1 Teknik Informatika"),
        _infoTile("Fakultas", "Teknik"),
        SizedBox(height: 20),
        Text(
          "Aktivitas Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _infoTile("First access to site", "Sunday, 28 Desember 2025"),
        _infoTile("Last access to site", "Tuesday, 30 Desember 2025 (now)"),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0B0547)),
            onPressed: () {},
            icon: Icon(Icons.logout, color: Colors.white),
            label: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _infoTile(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.black54, fontSize: 13)),
          Text(subtitle, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// --- TAB KELAS ---
class KelasTab extends StatelessWidget {
  final List<String> subjects = [
    "BAHASA INGGRIS: BUSINESS AND SCIENTIFIC",
    "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
    "KEWARGANEGARAAN",
    "OLAH RAGA D3TT-44-02",
    "SISTEM OPERASI D4SM-44-02",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          title: Text(
            subjects[index],
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Tanggal Mulai Monday, 8 February 2021",
            style: TextStyle(fontSize: 10),
          ),
        );
      },
    );
  }
}

// --- TAB EDIT PROFILE ---
class EditProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(25),
      children: [
        _buildTextField("Nama Pertama"),
        _buildTextField("Nama Terakhir"),
        _buildTextField("E-mail Address"),
        _buildTextField("Negara"),
        _buildTextField("Deskripsi", maxLines: 4),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 5),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
