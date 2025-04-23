// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';

// class StudentLoanApp extends StatelessWidget {
//   const StudentLoanApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Student Loan Application',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const LoanApplicationForm(),
//     );
//   }
// }

// class LoanApplicationForm extends StatefulWidget {
//   const LoanApplicationForm({super.key});

//   @override
//   _LoanApplicationFormState createState() => _LoanApplicationFormState();
// }

// class _LoanApplicationFormState extends State<LoanApplicationForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _dateController = TextEditingController();
//   DateTime? _selectedDate;
//   bool _hasCoSigner = false;
//   bool _termsAccepted = false;

//   // Form fields values
//   String _fullName = '';
//   String _studentId = '';
//   String _email = '';
//   String _phone = '';
//   String _course = '';
//   String _university = '';
//   double _loanAmount = 0;
//   String? _coSignerName;
//   String? _coSignerRelationship;
//   String? _coSignerPhone;

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }

//   void _submitApplication() {
//     if (_formKey.currentState!.validate() && _termsAccepted) {
//       _formKey.currentState!.save();
      
//       // Here you would typically send the data to a backend service
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Application Submitted'),
//           content: const Text('Your loan application has been received.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('OK'),
//             )
//           ],
//         ),
//       );
//     } else if (!_termsAccepted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please accept the terms and conditions')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Student Loan Application')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Full Name',
//                   icon: Icon(Icons.person),
//                 ),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter your full name' : null,
//                 onSaved: (value) => _fullName = value!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Student ID',
//                   icon: Icon(Icons.badge),
//                 ),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter your student ID' : null,
//                 onSaved: (value) => _studentId = value!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   icon: Icon(Icons.email),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) =>
//                     !value!.contains('@') ? 'Invalid email address' : null,
//                 onSaved: (value) => _email = value!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Phone Number',
//                   icon: Icon(Icons.phone),
//                 ),
//                 keyboardType: TextInputType.phone,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 validator: (value) =>
//                     value!.length < 10 ? 'Invalid phone number' : null,
//                 onSaved: (value) => _phone = value!,
//               ),
//               TextFormField(
//                 controller: _dateController,
//                 decoration: const InputDecoration(
//                   labelText: 'Date of Birth',
//                   icon: Icon(Icons.calendar_today),
//                 ),
//                 onTap: () => _selectDate(context),
//                 readOnly: true,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please select your date of birth' : null,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Course of Study',
//                   icon: Icon(Icons.school),
//                 ),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter your course' : null,
//                 onSaved: (value) => _course = value!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'University/College',
//                   icon: Icon(Icons.account_balance),
//                 ),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter your institution' : null,
//                 onSaved: (value) => _university = value!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Loan Amount Requested',
//                   icon: Icon(Icons.attach_money),
//                 ),
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter the loan amount' : null,
//                 onSaved: (value) => _loanAmount = double.parse(value!),
//               ),
//               SwitchListTile(
//                 title: const Text('Include Co-Signer'),
//                 value: _hasCoSigner,
//                 onChanged: (value) => setState(() => _hasCoSigner = value),
//               ),
//               if (_hasCoSigner) ...[
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Co-Signer Name',
//                     icon: Icon(Icons.person_outline),
//                   ),
//                   onSaved: (value) => _coSignerName = value,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Relationship to Co-Signer',
//                     icon: Icon(Icons.group),
//                   ),
//                   onSaved: (value) => _coSignerRelationship = value,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Co-Signer Phone Number',
//                     icon: Icon(Icons.phone_android),
//                   ),
//                   keyboardType: TextInputType.phone,
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                   onSaved: (value) => _coSignerPhone = value,
//                 ),
//               ],
//               CheckboxListTile(
//                 title: const Text('I agree to the terms and conditions'),
//                 value: _termsAccepted,
//                 onChanged: (value) => setState(() => _termsAccepted = value!),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitApplication,
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: const Text('Submit Application'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }