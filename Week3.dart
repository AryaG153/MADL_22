import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CommonWidgets(),
    );
  }
}

class CommonWidgets extends StatefulWidget {
  const CommonWidgets({super.key});

  @override
  State<CommonWidgets> createState() => _CommonWidgetsState();
}

class _CommonWidgetsState extends State<CommonWidgets> {
  final name = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Common Widgets")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome to Flutter",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),

            const Text("Flutter is fast and beautiful!"),

            const SizedBox(height: 20),

            Container(
              height: 150,
              width: double.infinity,
              color: Colors.blue.shade100,
              child: const Center(
                child: FlutterLogo(size: 90),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Button"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Cancel"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 20),

            TextField(
              controller: name,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Submitted Successfully!")),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

