import 'package:flutter/material.dart';

class MateriKeDua extends StatelessWidget {
  const MateriKeDua({super.key});

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
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Konsep User Interface Design",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
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
                            _buildLampiranContent(controller),
                            _buildTugasContent2(controller),
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

  Widget _buildLampiranContent(ScrollController controller) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          "Deskripsi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.",
          style: TextStyle(fontSize: 14, height: 1.5),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
        // Item lampiran sesuai gambar (Semua Tercentang Hijau)
        AttachmentItem(
          icon: Icons.link,
          title: "Zoom Meeting Syncronous",
          isChecked: true,
        ),
        AttachmentItem(
          icon: Icons.description_outlined,
          title: "Elemen-elemen Antarmuka Pengguna",
          isChecked: true,
        ),
        AttachmentItem(
          icon: Icons.description_outlined,
          title: "UID Guidelines and Principles",
          isChecked: true,
        ),
        AttachmentItem(
          icon: Icons.description_outlined,
          title: "User Profile",
          isChecked: true,
        ),
        AttachmentItem(
          icon: Icons.link,
          title: "Principles of User Interface DesignURL",
          isChecked: true,
        ),
      ],
    );
  }

  Widget _buildTugasContent2(ScrollController controller) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Deskripsi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna...",
          style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),

        // Item Kuis (Sesuai Gambar Kuis 2.png)
        _buildTaskCard(
          icon: Icons.quiz_outlined,
          title: "Quiz Review 01",
          description:
              "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan. Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
          isCompleted: true, // Centang Hijau
        ),

        const SizedBox(height: 12),

        // Item Tugas (Sesuai Gambar Kuis 2.png)
        _buildTaskCard(
          icon: Icons.assignment_outlined,
          title: "Tugas 01 - UID Android Mobile Game",
          description:
              "1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi ...........",
          isCompleted: false, // Centang Abu-abu
        ),
      ],
    );
  }

  Widget _buildTaskCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isCompleted,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        // Agar garis pemisah mengikuti tinggi konten
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sisi Kiri (Ikon)
            Container(
              width: 60,
              padding: const EdgeInsets.all(12),
              child: Center(child: Icon(icon, size: 30, color: Colors.black87)),
            ),
            // Garis Pemisah Vertikal
            VerticalDivider(
              width: 1,
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            // Sisi Kanan (Teks & Status)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: isCompleted
                              ? Colors.green
                              : Colors.grey.shade400,
                          size: 20,
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable widget untuk item lampiran
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
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
          Icon(
            Icons.check_circle,
            color: isChecked ? Colors.green : Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
