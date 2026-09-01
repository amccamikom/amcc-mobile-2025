import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding1Page extends StatelessWidget {
  const Onboarding1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // Agar tidak tertutup notch/status bar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              // Bagian Atas (Gambar & Teks)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Pusatkan konten di tengah layar
                  children: [
                    Image.asset(
                      'assets/img_onboarding.png',
                      width: double.infinity,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Yuk Mulai Catat Aktivitasmu!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Sering bingung cara mengelola tugas yang\nnumpuk agar tersusun rapi? yuk mulai gunain\nto do list buat bantu mengelola tugasmu',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                        height:
                            1.5, // Tambahkan line height agar lebih enak dibaca
                      ),
                    ),
                  ],
                ),
              ),

              // Bagian Bawah (Tombol)
              SizedBox(
                width: double.infinity, // Tombol selebar layar
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/onboarding2');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3254FD),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Lanjut',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
