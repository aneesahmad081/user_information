class Student {
  final String name;
  final String fatherName;
  final String subject;
  final int marks;
  final int rollNumber;

  Student({
    required this.name,
    required this.fatherName,
    required this.subject,
    required this.marks,
    required this.rollNumber,
  });

  factory Student.fromMap(Map<String, dynamic> data) {
    return Student(
      name: data['name'] ?? '',
      fatherName: data['fatherName'] ?? '',
      subject: data['subject'] ?? '',
      marks: (data['marks'] ?? 0).toInt(),
      rollNumber: (data['rollNumber'] ?? 0).toInt(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fatherName': fatherName,
      'subject': subject,
      'marks': marks,
      'rollNumber': rollNumber,
    };
  }
}
