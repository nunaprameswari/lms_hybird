import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  final Color primaryColor = const Color(0xFFB74A4A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // ===== HEADER =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: primaryColor,
            child: Column(
              children: [
                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // Avatar
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),

                const SizedBox(height: 12),

                const Text(
                  'DANDY CANDRA PRATAMA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // ===== TAB MENU =====
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _TabItem('About Me', true),
                _TabItem('Kelas', false),
                _TabItem('Edit Profile', false),
              ],
            ),
          ),

          // ===== CONTENT =====
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi User',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 10),

                  _infoItem(
                    'Email address',
                    'dandycandra@365.telkomuniversity.ac.id',
                  ),
                  _infoItem(
                    'Program Studi',
                    'D4 Teknologi Rekayasa Multimedia',
                  ),
                  _infoItem('Fakultas', 'FIT'),

                  const SizedBox(height: 20),

                  const Text(
                    'Aktivitas Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 10),

                  _infoItem(
                    'First access to site',
                    'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)',
                  ),
                  _infoItem(
                    'Last access to site',
                    'Tuesday, 22 June 2021, 9:44 PM (now)',
                  ),

                  const SizedBox(height: 30),

                  // ===== LOGOUT =====
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Log Out'),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),

      // ===== BOTTOM NAV =====
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}

// ===== TAB ITEM =====
class _TabItem extends StatelessWidget {
  final String title;
  final bool active;

  const _TabItem(this.title, this.active);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        if (active)
          Container(height: 2, width: 30, color: const Color(0xFFB74A4A)),
      ],
    );
  }
}
