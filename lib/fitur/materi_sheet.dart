import 'package:flutter/material.dart';

class MateriDetailSheet extends StatelessWidget {
  final String pertemuan;

  const MateriDetailSheet({super.key, required this.pertemuan});

  String _getTitle() {
    switch (pertemuan) {
      case "Pertemuan 1":
        return "Pengantar User Interface Design";
      case "Pertemuan 2":
        return "Konsep User Interface Design";
      case "Pertemuan 3":
        return "Interaksi pada UI Design";
      default:
        return "Materi";
    }
  }

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
              // Indikator pegangan atas (Handle Bar)
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _getTitle(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                            // Konten Tab Lampiran Materi
                            _buildLampiranContent(controller),
                            // Konten Tab Tugas dan Kuis
                            _buildTugasContent(controller),
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
          "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain...",
          style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
        // Daftar item lampiran sesuai gambar
        AttachmentItem(
          icon: Icons.link,
          title: "Zoom Meeting Syncronous",
          isChecked: true,
        ),
        AttachmentItem(
          icon: Icons.description_outlined,
          title: "Pengantar User Interface Design",
          isChecked: false,
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
    );
  }

  Widget _buildTugasContent(ScrollController controller) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Tugas dan Kuis",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          "Berikut adalah daftar tugas dan kuis yang harus diselesaikan untuk materi ini.",
          style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        // Daftar tugas dan kuis
        _buildTugasItem(
          icon: Icons.assignment,
          title: "Tugas 1: Pengantar UI Design",
          subtitle: "Deadline: 15 Oktober 2023",
          isCompleted: false,
        ),
        _buildTugasItem(
          icon: Icons.quiz,
          title: "Kuis 1: Konsep Dasar UI",
          subtitle: "Durasi: 30 menit",
          isCompleted: true,
        ),
        _buildTugasItem(
          icon: Icons.assignment,
          title: "Tugas 2: Prinsip Desain",
          subtitle: "Deadline: 20 Oktober 2023",
          isCompleted: false,
        ),
        _buildTugasItem(
          icon: Icons.quiz,
          title: "Kuis 2: Interaksi Pengguna",
          subtitle: "Durasi: 45 menit",
          isCompleted: false,
        ),
      ],
    );
  }

  Widget _buildTugasItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 6)],
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black54),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle tugas action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isCompleted
                  ? Colors.green
                  : const Color(0xFFB34B4B),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: Text(isCompleted ? "Selesai" : "Kerjakan"),
          ),
        ],
      ),
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
        borderRadius: BorderRadius.circular(30), // Membuat bentuk kapsul
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
          Icon(icon, size: 20, color: Colors.black54),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
          Icon(
            Icons.check_circle,
            color: isChecked ? Colors.green : Colors.grey[350],
          ),
        ],
      ),
    );
  }
}
