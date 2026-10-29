import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Icons, Images & Charts')),
        body: Column(
          children: [
            // Icon
            const Icon(Icons.star, size: 60, color: Colors.orange),

            const SizedBox(height: 20),

            // Image
            Image.network(
              'https://picsum.photos/300/150',
              height: 150,
            ),

            const SizedBox(height: 20),

            // Chart
            const Text(
              'Student Performance',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(width: 40, height: 80, color: Colors.blue),
                Container(width: 40, height: 120, color: Colors.green),
                Container(width: 40, height: 100, color: Colors.orange),
                Container(width: 40, height: 150, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

