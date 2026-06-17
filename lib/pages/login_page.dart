import 'package:edutrack_app/services/auth_service.dart';
import 'package:edutrack_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService authService = AuthService();
  bool isLoading = false;

  Future<void>login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await authService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if(!mounted) return;

      Navigator.pushReplacementNamed(context, '/home');
    } catch(e) {
      String message;

      switch (e) {
        case 'invalid-credential':
          message =
              "Email atau password yang Anda masukkan salah. Silakan coba lagi.";
          break;

        case 'network-request-failed':
          message =
              "Tidak dapat terhubung ke internet. Periksa koneksi Anda.";
          break;

        case 'too-many-requests':
          message =
              "Terlalu banyak percobaan login. Silakan coba beberapa saat lagi.";
          break;

        default:
          message =
              "Terjadi kesalahan saat proses login. Silakan coba kembali.";
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Login Gagal",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            message,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "OK",
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Column(
                  children: [
                    Image.asset("assets/edutrack-logo.png"),
                    SizedBox(height: 5),
                    Text(
                      "EDUTRACK",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3254FD),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Text(
                            "Masuk",
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Isi data diri anda untuk masuk ke akun anda",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 32),
                      buildTextField(label: 'Email', hintText: 'Masukkan email', controller: _emailController),
                      const SizedBox(height: 20),
                      buildTextField(label: 'Password', hintText: 'Masukkan password', isPassword: true, controller: _passwordController),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3254FD),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(isLoading ? 'Loading...' : 'Masuk', style:GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        height: 20,
                        thickness: 3,
                        indent: 5,
                        endIndent: 5,
                        color: Color(0xFFE0E0E0),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Belum punya akun?",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/register');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              overlayColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory
                            ),
                            child: Text(
                              "Daftar",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF3254FD)
                              ),
                            )
                          )
                        ],
                      ),
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        )
      )
    );
  }
}