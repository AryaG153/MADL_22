import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.flutter_dash, size: 80, color: Colors.blue),
            const Text("Welcome to Flutter!",
                style: TextStyle(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => setState(() => count--),
                  icon: const Icon(Icons.remove),
                ),
                Text("$count", style: const TextStyle(fontSize: 20)),
                IconButton(
                  onPressed: () => setState(() => count++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: "Enter name"),
            ),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Hello, ${name.text}!")),
              ),
              child: const Text("Say Hello"),
            ),
          ],
        ),
      ),
    );
  }
}
