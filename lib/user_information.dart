// import 'package:flutter/material.dart';

// class UserFormPage extends StatelessWidget {
//   const UserFormPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.network(
//               "https://images.pexels.com/photos/6279780/pexels-photo-6279780.jpeg",
//               fit: BoxFit.cover,
//               height: 200,
//               width: double.infinity,
//             ),

//             Padding(padding: const EdgeInsets.all(20.0), child: _buildForm()),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildForm() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "User Information",
//           style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Welcome back! Please fill in your information below.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 30),

//         TextField(
//           decoration: InputDecoration(
//             labelText: "Enter your name",
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//           ),
//         ),
//         const SizedBox(height: 20),

//         TextField(
//           decoration: InputDecoration(
//             labelText: "Enter your father's name",
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//           ),
//         ),
//         const SizedBox(height: 20),

//         DropdownButtonFormField<String>(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//           ),
//           hint: const Text("Select a Subject"),
//           items:
//               [
//                     "Professinol Practices",
//                     "NoSQL Database Systems",
//                     "Virtual Systems & Services ",
//                     "Mobile Applications Development",
//                   ]
//                   .map(
//                     (subject) =>
//                         DropdownMenuItem(value: subject, child: Text(subject)),
//                   )
//                   .toList(),
//           onChanged: (value) {},
//         ),
//         const SizedBox(height: 20),

//         TextField(
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(
//             labelText: "Enter Marks",
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//           ),
//         ),
//         const SizedBox(height: 30),

//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               backgroundColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: const Text(
//               "Submit",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
