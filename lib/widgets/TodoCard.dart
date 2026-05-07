import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ============ CUSTOM WIDGET: Todo Card ============
class TodoCard extends StatefulWidget {
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
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: _isChecked ? Colors.green : Colors.amber,
              width: 5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Circular checkbox
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                  widget.onCheckChanged(_isChecked);
                },
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isChecked ? const Color(0xFF3254FD) : Colors.white,
                    border: Border.all(
                      color: _isChecked ? const Color(0xFF3254FD) : const Color(0xFFCBD5E1),
                      width: 1.5,
                    ),
                  ),
                  child: _isChecked
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              // Title & Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: _isChecked ? TextDecoration.lineThrough : null,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.date,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
              // Delete Button
              IconButton(
                onPressed: widget.onDelete,
                icon: const Icon(Icons.delete, color: Color(0xFFEF4444), size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
