import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _materiItem(
          pertemuan: 'Pertemuan 1',
          title: '01 – Pengantar User Interface Design',
          subtitle: '3 URLs, 2 Files, 3 Interactive Content',
          done: false,
        ),
        _materiItem(
          pertemuan: 'Pertemuan 2',
          title: '02 – Konsep User Interface Design',
          subtitle: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
          done: true,
        ),
        _materiItem(
          pertemuan: 'Pertemuan 3',
          title: '03 – Interaksi pada User Interface Design',
          subtitle: '3 URLs, 2 Files, 3 Interactive Content',
          done: true,
        ),
        _materiItem(
          pertemuan: 'Pertemuan 4',
          title: '04 – Ethnographic Observation',
          subtitle: '3 URLs, 2 Files, 3 Interactive Content',
          done: true,
        ),
      ],
    );
  }

  Widget _materiItem({
    required String pertemuan,
    required String title,
    required String subtitle,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text(pertemuan),
                  backgroundColor: Colors.blue,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
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
