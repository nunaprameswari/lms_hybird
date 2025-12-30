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
                  showButton: true,
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
  final bool showButton;

  const MateriItem({
    super.key,
    required this.pertemuan,
    required this.title,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(label: Text(pertemuan)),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (showButton) ...[
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const MateriDetailSheet(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB34B4B),
                foregroundColor: Colors.white,
              ),
              child: const Text("Lihat Materi"),
            ),
          ],
        ],
      ),
    );
  }
}

class MateriDetailSheet extends StatelessWidget {
  const MateriDetailSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Handle Bar
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              // Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Pengantar User Interface Design",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              // Description
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(text: "Lampiran Materi"),
                          Tab(text: "Tugas dan Kuis"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Lampiran Materi Content
                            ListView(
                              controller: controller,
                              padding: const EdgeInsets.all(16),
                              children: const [
                                Text(
                                  "Deskripsi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience",
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 20),
                                AttachmentItem(
                                  icon: Icons.link,
                                  title: "Zoom Meeting Syncronous",
                                  isChecked: true,
                                ),
                                AttachmentItem(
                                  icon: Icons.description_outlined,
                                  title: "Pengantar User Interface Design",
                                  isChecked: false, // Image shows check, but let's vary or matching exact image? Image has grey check for some? No, mostly green.
                                  // Wait, the image provided shows checks on everything. I'll stick to generic checked.
                                  // Actually image shows grey check on item 2 and 3. I will allow customizing color/checked.
                                ),
                                AttachmentItem(
                                  icon: Icons.description_outlined,
                                  title: "Empat Teori Dasar Antarmuka Pengguna",
                                  isChecked: false,
                                ),
                                AttachmentItem(
                                  icon: Icons.description_outlined,
                                  title: "Empat Teori Dasar Antarmuka Pengguna",
                                  isChecked: true,
                                ),
                                AttachmentItem(
                                  icon: Icons.video_library_outlined,
                                  title: "User Interface Design for Beginner",
                                  isChecked: true,
                                ),
                                AttachmentItem(
                                  icon: Icons.link,
                                  title: "20 Prinsip Desain",
                                  isChecked: true,
                                ),
                                AttachmentItem(
                                  icon: Icons.link,
                                  title: "Best Practice UI Design",
                                  isChecked: true,
                                ),
                              ],
                            ),
                            // Tugas dan Kuis Placeholder
                            ListView(
                              children: const [
                                Center(padding: EdgeInsets.all(20), child: Text("Belum ada tugas"))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AttachmentItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isChecked;

  const AttachmentItem({
    super.key,
    required this.icon,
    required this.title,
    this.isChecked = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded pill shape
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.check_circle,
            color: isChecked ? Colors.green : Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
