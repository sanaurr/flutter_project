import 'package:flutter/material.dart';

class NoteView extends StatefulWidget {
  final String note;
  final VoidCallback onDelete;

  const NoteView({super.key, required this.note, required this.onDelete});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Checkbox(
            value: isDone,
            onChanged: (value) {
              if (value != null) {
                isDone = value;
                setState(() {});
              }
            },
          ),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.note,
                  style: TextStyle(
                    decoration: isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onDelete();
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
