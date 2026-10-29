import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationForm(),
    ));

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final key = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();

  String gender = "Male", dept = "IT";
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: key,
          child: Column(
            children: [
              const Text("Student Registration",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    labelText: "Name", border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? "Enter name" : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
                validator: (v) =>
                    !v!.contains("@") ? "Enter valid email" : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: mobile,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Mobile", border: OutlineInputBorder()),
                validator: (v) =>
                    v!.length != 10 ? "Enter 10-digit number" : null,
              ),

              const SizedBox(height: 15),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Gender",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),

              Row(
                children: ["Male", "Female"]
                    .map((g) => Expanded(
                          child: RadioListTile(
                            title: Text(g),
                            value: g,
                            groupValue: gender,
                            onChanged: (v) =>
                                setState(() => gender = v.toString()),
                          ),
                        ))
                    .toList(),
              ),

              DropdownButtonFormField(
                value: dept,
                decoration: const InputDecoration(
                    labelText: "Department",
                    border: OutlineInputBorder()),
                items: ["IT", "Computer", "EXTC", "Mechanical"]
                    .map((d) =>
                        DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (v) => setState(() => dept = v.toString()),
              ),

              CheckboxListTile(
                title: const Text("I agree to Terms & Conditions"),
                value: agree,
                onChanged: (v) => setState(() => agree = v!),
              ),

              ElevatedButton(
                onPressed: () {
                  if (!key.currentState!.validate()) return;

                  if (!agree) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Accept Terms first")),
                    );
                    return;
                  }

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Registration Successful"),
                      content: Text(
                          "Name: ${name.text}\nEmail: ${email.text}\n"
                          "Mobile: ${mobile.text}\nGender: $gender\n"
                          "Department: $dept"),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"))
                      ],
                    ),
                  );
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
