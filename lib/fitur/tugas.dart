import 'package:flutter/material.dart';
import 'quizreview.dart';

class TugasPage extends StatelessWidget {
  const TugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0547),
        title: const Text(
          "Tugas Dan Kuis",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TugasItem(
            label: "QUIZ",
            title: "Quiz Review 01",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizReview()),
              );
            },
          ),
          const TugasItem(
            label: "TUGAS",
            title: "Tugas 01 – UID Android Mobile Game",
          ),
          const TugasItem(label: "QUIZ", title: "Kuis – Assessment 2"),
        ],
      ),
    );
  }
}

class TugasItem extends StatelessWidget {
  final String label;
  final String title;
  final VoidCallback? onTap;

  const TugasItem({
    super.key,
    required this.label,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(label: Text(label)),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
