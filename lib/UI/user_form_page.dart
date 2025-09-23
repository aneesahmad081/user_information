import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_information/Model/student_model.dart';
import 'package:user_information/Provider/student_provider.dart';
import 'package:user_information/UI/search_page.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _nameController = TextEditingController();
  final _fatherController = TextEditingController();
  final _marksController = TextEditingController();
  final _rollNumberControll = TextEditingController();
  String? _selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Add Student Info"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "User Information",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _fatherController,
              decoration: InputDecoration(
                labelText: "Enter your father's name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _rollNumberControll,
              decoration: InputDecoration(
                labelText: "Enter your Roll Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              hint: const Text("Select a Subject"),
              value: _selectedSubject,
              items:
                  [
                        "Professional Practices",
                        "NoSQL Database Systems",
                        "Virtual Systems & Services",
                        "Mobile Applications Development",
                      ]
                      .map(
                        (subject) => DropdownMenuItem(
                          value: subject,
                          child: Text(subject),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSubject = value;
                });
              },
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _marksController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Marks",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isEmpty ||
                      _fatherController.text.isEmpty ||
                      _selectedSubject == null ||
                      _marksController.text.isEmpty) {
                    return;
                  }

                  final student = Student(
                    name: _nameController.text,
                    fatherName: _fatherController.text,
                    subject: _selectedSubject!,
                    marks: int.parse(_marksController.text),
                    rollNumber: int.parse(_rollNumberControll.text),
                  );

                  Provider.of<StudentProvider>(
                    context,
                    listen: false,
                  ).addStudent(student);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Student Added")),
                  );
                },
                child: const Text("Submit"),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: TextButton(
                child: const Text("Go to Search Page"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
