import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FilePage(),
      ),
    );

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  final data = TextEditingController();
  String saved = "", msg = "Enter data and Save";

  Future<void> save() async {
    if (data.text.isEmpty) {
      setState(() => msg = "Enter some data");
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      saved = data.text;
      msg = "Data saved successfully";
    });
  }

  Future<void> read() async {
    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      msg = saved.isEmpty ? "No data found" : "Saved: $saved";
    });
  }

  void delete() => setState(() {
        saved = "";
        data.clear();
        msg = "Data deleted";
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Operations"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.folder, size: 70),

            TextField(
              controller: data,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Enter Data",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: save,
                    child: const Text("Save"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: read,
                    child: const Text("Read"),
                  ),
                ),
              ],
            ),

            OutlinedButton(
              onPressed: delete,
              child: const Text("Delete"),
            ),

            const SizedBox(height: 20),

            Text(
              msg,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    data.dispose();
    super.dispose();
  }
}

