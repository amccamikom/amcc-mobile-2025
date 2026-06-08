import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  /// Data profil: [Ikon, Judul, Nilai, Skema URI untuk url_launcher].
  /// Jika uriStr bernilai null, maka kartu tidak dapat diklik (pasif).
  static const _infoItems = [
    (Icons.mail_outline, 'Email', 'putri@gmail.com', 'mailto:putri@gmail.com'),
    (Icons.favorite_border, 'Hobi', 'Belajar Matematika', null),
    (Icons.phone_outlined, 'No Handphone', '081234567890', 'tel:081234567890'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipOval(
              child: Image.asset(
                'assets/profil.jpg',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Rillya Putri',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Mahasiswa',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 40),

            // Mapping data _infoItems secara dinamis menjadi deretan _InfoCard
            ..._infoItems.map(
              (item) => _InfoCard(
                icon: item.$1,
                title: item.$2,
                value: item.$3,
                uriStr: item.$4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? uriStr;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    this.uriStr,
  });

  /// Membuka URI eksternal (Email/Dialer) menggunakan url_launcher.
  /// Menampilkan SnackBar jika aplikasi tujuan tidak berhasil merespon.
  Future<void> _launch(BuildContext context) async {
    if (uriStr == null) return;
    final uri = Uri.parse(uriStr!);

    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Tidak dapat membuka: $value')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Aksi tap hanya aktif jika tautan URI tersedia (tidak null)
      onTap: uriStr != null ? () => _launch(context) : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF3B5998), size: 28),
            const SizedBox(width: 20),

            /// CRITICAL: Flexible wajib digunakan untuk membatasi lebar Column di dalam Row.
            /// Ini mencegah error 'layout overflow' jika teks pada variabel [value] terlalu panjang.
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    overflow: TextOverflow
                        .ellipsis, // Potong teks meluber dengan titik tiga (...)
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
