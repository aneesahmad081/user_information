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
        title: const Text(
          'Add Student Info',
          style: TextStyle(color: Colors.white),
        ),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://scontent.fisb5-1.fna.fbcdn.net/v/t39.30808-6/512696822_24736909952576872_3980873767850930798_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=SBmVvRuf1mEQ7kNvwHzZpfA&_nc_oc=AdlzPgSEznQZNUJSpCMXJDhOQwpdO4VSTNC_b_RZnndhdVlIKU6ZjC_3euXIHTSdwWfQQzlvMO2tbtqaD4pD1RfG&_nc_zt=23&_nc_ht=scontent.fisb5-1.fna&_nc_gid=Kr4Ag0aqZYelec4eL8pb8A&oh=00_AfaaeMiS7RDAu-QFCKzJ7teO8-7YakIn-SdzmKp4BMbhkQ&oe=68D984B3',
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Student Information",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Student Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: _fatherController,
                    decoration: InputDecoration(
                      labelText: "Father's Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: _rollNumberControll,
                    decoration: InputDecoration(
                      labelText: "Roll Number",
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
                      labelText: "Marks",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_nameController.text.isEmpty ||
                            _fatherController.text.isEmpty ||
                            _selectedSubject == null ||
                            _marksController.text.isEmpty ||
                            _rollNumberControll.text.isEmpty) {
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

                        _nameController.clear();
                        _fatherController.clear();
                        _rollNumberControll.clear();
                        _marksController.clear();
                        setState(() {
                          _selectedSubject = null;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Student Data Added")),
                        );
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(color: Colors.indigo, width: 2),
                      ),
                      child: const Text(
                        "Go to Search Page",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo,
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }
}
