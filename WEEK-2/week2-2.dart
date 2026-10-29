import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    ));

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Widget card(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(icon, size: 35),
              Text(value,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Dashboard")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.indigo,
              child: const ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text("Welcome Back!",
                    style: TextStyle(color: Colors.white)),
                subtitle: Text("Dashboard Overview",
                    style: TextStyle(color: Colors.white70)),
              ),
            ),

            const Text("Statistics",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            Row(children: [
              card("Revenue", "\$12K", Icons.attach_money),
              card("Users", "1250", Icons.people),
            ]),

            Row(children: [
              card("Messages", "48", Icons.message),
              card("Orders", "120", Icons.shopping_bag),
            ]),

            const SizedBox(height: 20),

            const Text("Quick Actions",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            Wrap(
              spacing: 10,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add),
                  label: const Text("Add User"),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bar_chart),
                  label: const Text("Reports"),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  label: const Text("Settings"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text("Recent Activity",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            const ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("New Order Received"),
              subtitle: Text("2 minutes ago"),
            ),
            const ListTile(
              leading: Icon(Icons.payment),
              title: Text("Payment Successful"),
              subtitle: Text("15 minutes ago"),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("New User Registered"),
              subtitle: Text("30 minutes ago"),
            ),
          ],
        ),
      ),
    );
  }
}

