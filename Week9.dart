import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const url = 'https://odvqfrfctmrdsazhnjam.supabase.co';
const key = 'YOUR_PUBLISHABLE_KEY';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const StudentPage(),
      );
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final id = TextEditingController();
  final name = TextEditingController();
  final course = TextEditingController();

  String msg = "Enter student details";

  Future<void> save() async {
    await html.HttpRequest.request(
      '$url/rest/v1/students',
      method: 'POST',
      requestHeaders: {
        'apikey': key,
        'Content-Type': 'application/json',
      },
      sendData: jsonEncode({
        'id': int.parse(id.text),
        'name': name.text,
        'course': course.text,
      }),
    );
    setState(() => msg = "Saved successfully!");
  }

  Future<void> read() async {
    final r = await html.HttpRequest.request(
      '$url/rest/v1/students?select=*',
      requestHeaders: {'apikey': key},
    );
    setState(() => msg = r.responseText ?? "");
  }

  Future<void> delete() async {
    await html.HttpRequest.request(
      'url/rest/v1/students?id=eq.{id.text}',
      method: 'DELETE',
      requestHeaders: {'apikey': key},
    );
    setState(() => msg = "Deleted successfully!");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Student Database")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(controller: id, decoration: const InputDecoration(labelText: "Student ID")),
              TextField(controller: name, decoration: const InputDecoration(labelText: "Name")),
              TextField(controller: course, decoration: const InputDecoration(labelText: "Course")),
              const SizedBox(height: 15),
              ElevatedButton(onPressed: save, child: const Text("SAVE")),
              ElevatedButton(onPressed: read, child: const Text("READ")),
              ElevatedButton(onPressed: delete, child: const Text("DELETE")),
              const SizedBox(height: 15),
              Text(msg),
            ],
          ),
        ),
      );
);