import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/TodoCard.dart';
import '../widgets/CarouselWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mock data untuk daftar tugas
  List<Map<String, dynamic>> todayTasks = [
    {
      "title": "Belajar bahasa inggris",
      "date": "2 Maret 2026",
      "isDone": false,
    },
    {
      "title": "Belajar masak",
      "date": "2 Maret 2026",
      "isDone": false,
    },
    {
      "title": "Belajar piano",
      "date": "2 Maret 2026",
      "isDone": false,
    },
  ];

  List<Map<String, dynamic>> upcomingTasks = [
    {
      "title": "Belajar matematika",
      "date": "6 Maret 2026",
      "isDone": false,
    },
  ];

  void _showAddTaskDialog() {
    final titleController = TextEditingController();
    final dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            'Tambah task',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul task',
                  hintText: 'Contoh: Belajar Flutter',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal',
                  hintText: 'Contoh: 6 Maret 2026',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final date = dateController.text.trim();

                if (title.isEmpty || date.isEmpty) {
                  return;
                }

                setState(() {
                  todayTasks.insert(0, {
                    'title': title,
                    'date': date,
                    'isDone': false,
                  });
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3254FD),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/edutrack-logo.png', width: 20, height: 20),
            const SizedBox(width: 8),
            Text(
              'Edutrack',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showAddTaskDialog();
            },
            icon: const Icon(Icons.add, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============ GREETING SECTION ============
              Text(
                'Halo, user',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Selamat datang di aplikasi edutrack',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: const Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 20),

              // ============ CAROUSEL SECTION ============
              const CarouselWidget(),
              const SizedBox(height: 24),

              // ============ HARI INI SECTION ============
              Text(
                'Hari ini',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: todayTasks.length,
                itemBuilder: (context, index) {
                  final task = todayTasks[index];
                  return TodoCard(
                    title: task['title'],
                    date: task['date'],
                    isDone: task['isDone'],
                    onCheckChanged: (bool? value) {
                      setState(() {
                        todayTasks[index]['isDone'] = value ?? false;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        todayTasks.removeAt(index);
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 24),

              // ============ YANG AKAN DATANG SECTION ============
              Text(
                'Yang akan datang',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: upcomingTasks.length,
                itemBuilder: (context, index) {
                  final task = upcomingTasks[index];
                  return TodoCard(
                    title: task['title'],
                    date: task['date'],
                    isDone: task['isDone'],
                    onCheckChanged: (bool? value) {
                      setState(() {
                        upcomingTasks[index]['isDone'] = value ?? false;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        upcomingTasks.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
