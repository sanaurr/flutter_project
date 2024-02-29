
import 'package:flutter/material.dart';
import 'package:flutter_project/note_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> notes = [];

  final controller = TextEditingController();
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: null,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Light Theme"),
                      Switch(
                        value: isLight,
                        onChanged: (value) {
                          isLight = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                )
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, index) => itemBuilder(index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        child: const Icon(Icons.add),
      ),
    );
  }

  void addNote() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Todo List"),
          content: TextField(
            controller: controller,
            maxLines: 5,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                notes.add(controller.text);
                controller.text = "";
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  Widget? itemBuilder(index) {
    return NoteView(
      note: notes[index],
      onDelete: () {
        notes.removeAt(index);
        setState(() {});
      },
    );
  }
}
