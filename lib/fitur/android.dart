import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // HEADER MERAH & FOTO PROFIL
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFB34B4B), // Warna merah sesuai gambar
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage(
                        'assets/profile_pic.png',
                      ), // Ganti dengan foto Anda
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "DANDY CANDRA PRATAMA",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              // TAB BAR CARD
              Positioned(
                bottom: -40,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black54,
                    indicatorColor: Colors.grey,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(text: "About Me"),
                      Tab(text: "Kelas"),
                      Tab(text: "Edit Profile"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          // ISI TAB
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildAboutMe(), _buildKelas(), _buildEditProfile()],
            ),
          ),
        ],
      ),
      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // TAMPILAN TAB: ABOUT ME
  Widget _buildAboutMe() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      children: [
        const Text(
          "Informasi User",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _infoTile("Email address", "dandycandra@365.telkomuniversity.ac.id"),
        _infoTile("Program Studi", "D4 Teknologi Rekayasa Multimedia"),
        _infoTile("Fakultas", "FIT"),
        const SizedBox(height: 20),
        const Text(
          "Aktivitas Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _infoTile("First access to site", "Monday, 7 September 2020, 9:27 AM"),
        _infoTile("Last access to site", "Tuesday, 22 June 2021, 9:44 PM"),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text("Log Out"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[900],
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // TAMPILAN TAB: KELAS
  Widget _buildKelas() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        _kelasTile("BAHASA INGGRIS: BUSINESS AND SCIENTIFIC"),
        _kelasTile("DESAIN ANTARMUKA & PENGALAMAN PENGGUNA"),
        _kelasTile("KEWARGANEGARAAN"),
        _kelasTile("OLAH RAGA D3TT-44-02 [EYR]"),
        _kelasTile("PEMROGRAMAN MULTIMEDIA INTERAKTIF"),
      ],
    );
  }

  // TAMPILAN TAB: EDIT PROFILE
  Widget _buildEditProfile() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      children: [
        _editField("Nama Pertama"),
        _editField("Nama Terakhir"),
        _editField("E-mail Address"),
        _editField("Negara"),
        _editField("Deskripsi", maxLines: 4),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[100],
            foregroundColor: Colors.black,
          ),
          child: const Text("Simpan"),
        ),
      ],
    );
  }

  // REUSABLE WIDGETS
  Widget _infoTile(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _kelasTile(String title) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "Tanggal Mulai Monday, 8 February 2021",
        style: TextStyle(fontSize: 10),
      ),
    );
  }

  Widget _editField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          TextField(
            maxLines: maxLines,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFFB34B4B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, "Home"),
          _navItem(Icons.school_outlined, "Kelas Saya"),
          _navItem(Icons.notifications_none, "Notifikasi"),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );
  }
}
