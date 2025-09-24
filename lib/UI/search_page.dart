import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_information/Provider/student_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedSubject;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNumberController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    rollNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Search Students',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                provider.searchStudent(name: value);
              },
            ),
            const SizedBox(height: 16),

            TextField(
              controller: rollNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Roll Number",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                int? roll = int.tryParse(value);
                provider.searchStudent(rollNumber: roll);
              },
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Select Subject",
              ),
              hint: const Text("Select a Subject"),
              value: selectedSubject,
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
                  selectedSubject = value;
                });
                if (value != null) {
                  provider.searchStudent(name: value);
                }
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: provider.students.isEmpty
                  ? const Center(child: Text("No students found"))
                  : ListView.builder(
                      itemCount: provider.students.length,
                      itemBuilder: (context, index) {
                        final student = provider.students[index];
                        return ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(student.name),
                          subtitle: Text(
                            "Roll: ${student.rollNumber} - ${student.subject} - Marks: ${student.marks}",
                          ),
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
