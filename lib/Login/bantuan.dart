import 'package:flutter/material.dart';

class BantuanBottomSheet extends StatefulWidget {
  const BantuanBottomSheet({Key? key}) : super(key: key);

  @override
  State<BantuanBottomSheet> createState() => _BantuanBottomSheetState();
}

class _BantuanBottomSheetState extends State<BantuanBottomSheet> {
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 16),

          // Language Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _langButton('ID', !isEnglish, () {
                setState(() => isEnglish = false);
              }),
              const SizedBox(width: 10),
              _langButton('EN', isEnglish, () {
                setState(() => isEnglish = true);
              }),
            ],
          ),

          const SizedBox(height: 20),

          // Content
          SingleChildScrollView(
            child: Text(
              isEnglish ? bantuanEN : bantuanID,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, height: 1.5),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _langButton(String text, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFB74A4A) : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ================= TEXT =================

const String bantuanID = '''
Akses hanya untuk Dosen dan Mahasiswa Telkom University.

Login menggunakan Akun Microsoft Office 365
dengan mengikuti petunjuk berikut :

Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id"

Password (Akun iGracias) pada kolom Password.

Kegagalan yang terjadi pada Autentikasi disebabkan
Anda belum mengubah Password Anda menjadi "Strong Password".
Pastikan Anda telah melakukan perubahan Password di iGracias.

Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk :

mail : infoceloe@telkomuniversity.ac.id
whatsapp : +62 821-1666-3563
''';

const String bantuanEN = '''
Access restricted only for Lecturer and Student of Telkom University.

Login only using your Microsoft Office 365 Account
by following these format :

Username (iGracias Account) followed with "@365.telkomuniversity.ac.id"

Password (SSO / iGracias Account) on Password Field.

Failure upon Authentication could be possibly you
have not yet change your password into "Strong Password".
Make sure to change your password only in iGracias.

For further information, please contact CeLOE Service Helpdesk :

mail : infoceloe@telkomuniversity.ac.id
whatsapp : +62 821-1666-3563
''';
