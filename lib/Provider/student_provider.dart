import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_information/Model/student_model.dart';

class StudentProvider with ChangeNotifier {
  List<Student> students = [];

  Future<void> addStudent(Student student) async {
    await FirebaseFirestore.instance
        .collection("students")
        .add(student.toMap());
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("students")
        .get();

    students = snapshot.docs.map((doc) => Student.fromMap(doc.data())).toList();

    notifyListeners();
  }

  Future<void> searchStudent({String? name, int? rollNumber}) async {
    Query collectionQuery = FirebaseFirestore.instance.collection("students");

    // Add filters if provided
    if (name != null && name.isNotEmpty) {
      collectionQuery = collectionQuery.where("name", isEqualTo: name);
    }
    if (rollNumber != null) {
      collectionQuery = collectionQuery.where(
        "rollNumber",
        isEqualTo: rollNumber,
      );
    }

    var snapshot = await collectionQuery.get();

    students = snapshot.docs
        .map((doc) => Student.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    notifyListeners();
  }
}
