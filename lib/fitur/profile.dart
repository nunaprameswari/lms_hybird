import 'package:flutter/material.dart';
import 'kelas.dart';
import 'editprofile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Header Biru
              Editprofile(name: "DANDY CANDRA PRATAMA"),

              // Spasi untuk Tab Bar yang melayang
              SizedBox(height: 40),

              // Konten Tab
              Expanded(child: _buildTabContent()),
            ],
          ),
          // Tab Bar Custom (Melayang)
          Positioned(
            top: 240,
            left: 20,
            right: 20,
            child: CustomTabBar(
              selectedIndex: _currentTab,
              onTabTap: (index) => setState(() => _currentTab = index),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  Widget _buildTabContent() {
    switch (_currentTab) {
      case 0:
        return AboutMeTab();
      case 1:
        return KelasTab();
      case 2:
        return EditProfileTab();
      default:
        return AboutMeTab();
    }
  }
}
