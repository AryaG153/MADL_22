import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const Home(),
        '/second': (_) => const Second(),
      },
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String msg = "Tap the box";

  void change(String text) => setState(() => msg = text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation & Gestures")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => change("Single Tap"),
              onDoubleTap: () => change("Double Tap"),
              onLongPress: () => change("Long Press"),
              child: Container(
                width: 250,
                height: 150,
                color: Colors.blue.shade100,
                child: const Center(
                  child: Icon(Icons.touch_app, size: 60),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(msg, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              child: const Text("Next Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Go Back"),
        ),
      ),
    );
  }
}

