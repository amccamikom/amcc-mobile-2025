import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3254FD),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/edutrack-logo.png', width: 20, height: 20),
            SizedBox(width: 8),
            Text(
              "Edutrack",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(
                context, 
                '/login', 
                (route)=>false
              );
            },
            icon: Icon(Icons.logout, color: Colors.white, size: 20)
          )
        ],
      ),
    );
  }
}