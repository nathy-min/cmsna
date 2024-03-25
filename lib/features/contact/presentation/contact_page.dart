import 'package:flutter/material.dart';

import '../../home/presentation/widgets/custom_navigation_bar.dart';

class ContactMePage extends StatefulWidget {
  @override
  _ContactMePageState createState() => _ContactMePageState();
}

class _ContactMePageState extends State<ContactMePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Contact Me'),
      // ),
      bottomNavigationBar: CustomNavigationBar(
        initialIndex: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField("First Name", firstNameController),
              _buildTextField("Last Name", lastNameController),
              _buildTextField("Phone Number", phoneNumberController),
              _buildTextField("Email", emailController),
              _buildTextField("Subject", subjectController),
              _buildTextField("Message", messageController, maxLines: 4),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void _submitForm() {
    // Implement your form submission logic here
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String phoneNumber = phoneNumberController.text;
    String email = emailController.text;
    String subject = subjectController.text;
    String message = messageController.text;

    // You can add validation logic here before submitting the form

    // For now, just print the values
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Phone Number: $phoneNumber');
    print('Email: $email');
    print('Subject: $subject');
    print('Message: $message');
  }
}
