import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ============ CUSTOM WIDGET: Todo Card ============
class TodoCard extends StatelessWidget {
  final String title;
  final String date;
  final bool isDone;
  final VoidCallback onDelete;
  final Function(bool?) onCheckChanged;

  const TodoCard({
    super.key,
    required this.title,
    required this.date,
    required this.isDone,
    required this.onDelete,
    required this.onCheckChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: isDone ? Colors.green : Colors.amber,
              width: 5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  onCheckChanged(!isDone);
                },
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDone ? const Color(0xFF3254FD) : Colors.white,
                    border: Border.all(
                      color: isDone
                          ? const Color(0xFF3254FD)
                          : const Color(0xFFCBD5E1),
                      width: 1.5,
                    ),
                  ),
                  child: isDone
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: isDone ? TextDecoration.lineThrough : null,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Color(0xFFEF4444),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
