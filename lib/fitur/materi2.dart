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
                            const Center(child: Text("Belum ada tugas")),
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
