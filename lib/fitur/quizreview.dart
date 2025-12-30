import 'package:flutter/material.dart';

class QuizReview extends StatefulWidget {
  const QuizReview({super.key});

  @override
  State<QuizReview> createState() => _QuizReviewState();
}

class _QuizReviewState extends State<QuizReview> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;

  // Data simulasi status nomor soal (0: belum, 1: sedang dikerjakan, 2: sudah dijawab)
  // Sesuai gambar: nomor 1 berwarna hijau (sudah dijawab)
  List<int> questionStatus = [2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  final List<String> options = [
    "A.  Jenis Kelamin",
    "B.  Alamat",
    "C.  Hobby",
    "D.  Riwayat Pendidikan",
    "E.  Umur",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0547), // Warna merah sesuai gambar
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Quiz Review 1",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.timer_outlined, color: Colors.white),
                SizedBox(width: 4),
                Text(
                  "15 : 00",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grid Nomor Soal (1-15)
            Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(15, (index) {
                  return _buildQuestionNumber(index);
                }),
              ),
            ),
            const SizedBox(height: 30),

            // Teks Soal
            Text(
              "Soal Nomor ${currentQuestionIndex + 1} / 15",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 40),
            const Text(
              "Radio button dapat digunakan untuk menentukan ?",
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Daftar Pilihan Jawaban
            Column(
              children: List.generate(options.length, (index) {
                return _buildOptionItem(index);
              }),
            ),

            const SizedBox(height: 30),

            // Tombol Navigasi Bawah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentQuestionIndex > 0)
                  _buildNavButton("Soal Sebelum nya.", isPrimary: false)
                else
                  const SizedBox(),
                _buildNavButton("Soal Selanjut nya.", isPrimary: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Bulatan Nomor Soal
  Widget _buildQuestionNumber(int index) {
    bool isCurrent = index == currentQuestionIndex;
    bool isDone = questionStatus[index] == 2;

    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDone
            ? Colors.green
            : (isCurrent ? Colors.white : Colors.white),
        border: Border.all(
          color: isCurrent ? Colors.black : Colors.grey.shade400,
          width: isCurrent ? 2 : 1,
        ),
      ),
      child: Center(
        child: Text(
          "${index + 1}",
          style: TextStyle(
            color: isDone ? Colors.white : Colors.black,
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Widget untuk Item Pilihan Jawaban
  Widget _buildOptionItem(int index) {
    bool isSelected = selectedOptionIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOptionIndex = index;
        });
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFED6A6A)
              : const Color(0xFFF5F5F5), // Merah jika dipilih
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Text(
          options[index],
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Widget untuk Tombol "Sebelumnya/Selanjutnya"
  Widget _buildNavButton(String label, {bool isPrimary = false}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF5F5F5),
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}
