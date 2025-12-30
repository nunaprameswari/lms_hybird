import 'package:flutter/material.dart';
import 'package:lms_hybird/fitur/home.dart';

class Isiprofile extends StatelessWidget {
  final String name;
  const Isiprofile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF0B0547),
      ), // Warna merah sesuai gambar
      child: Column(
        children: [
          const SizedBox(height: 35),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Beranda()),
                  (route) => false,
                );
              },
            ),
          ),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.white24,
            backgroundImage: AssetImage(
              'assets/image/profil.jpeg',
            ), // Ganti dengan image path Anda
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTap;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem("About Me", 0),
          _buildTabItem("Kelas", 1),
          _buildTabItem("Edit Profile", 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTabTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 3,
              width: 30,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}

class CustomBottomNav extends StatefulWidget {
  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  // Variabel untuk melacak tab mana yang sedang aktif di bottom nav
  int _selectedIndex = 1; // Default ke "Kelas Saya" sesuai gambar

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFF0B0547),
        // borderRadius: BorderRadius.only(
        // topLeft: Radius.circular(30),
        // topRight: Radius.circular(30),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(0, Icons.home, "Home"),
          _navItem(1, Icons.school, "Kelas Saya"),
          _navItem(2, Icons.notifications, "Notifikasi"),
        ],
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    bool isActive = _selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Beranda(),
            ), // Membuka home.dart
          );
        }
        // Tambahkan logika navigasi di sini jika diperlukan, contoh:
        // print("Pindah ke halaman $label");
      },
      // SplashColor memberikan efek sentuhan air saat diklik
      splashColor: Colors.white24,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              // Memberikan ukuran sedikit lebih besar jika aktif
              size: isActive ? 30 : 24,
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
