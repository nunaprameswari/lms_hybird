import 'package:flutter/material.dart';

class TugasPage extends StatelessWidget {
  const TugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _tugasItem(
          label: 'QUIZ',
          title: 'Quiz Review 01',
          deadline: '26 Februari 2021 23:59 WIB',
          done: true,
        ),
        _tugasItem(
          label: 'Tugas',
          title: 'Tugas 01 – UID Android Mobile Game',
          deadline: '26 Februari 2021 23:59 WIB',
          done: false,
        ),
        _tugasItem(
          label: 'QUIZ',
          title: 'Kuis – Assessment 2',
          deadline: '26 Februari 2021 23:59 WIB',
          done: true,
        ),
      ],
    );
  }

  Widget _tugasItem({
    required String label,
    required String title,
    required String deadline,
    required bool done,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(label == 'QUIZ' ? Icons.quiz : Icons.assignment, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text(label),
                  backgroundColor: Colors.blue,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tenggat Waktu : $deadline',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(
            done ? Icons.check_circle : Icons.radio_button_unchecked,
            color: done ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}
