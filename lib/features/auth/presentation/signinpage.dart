import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField("Email", emailController),
            _buildTextField("Password", passwordController, isPassword: true),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            SignInButton(
              Buttons.Google,
              onPressed: _signInWithGoogle,
            ),
            SignInButton(
              Buttons.Facebook,
              onPressed: _signInWithFacebook,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void _submitForm() {
    // Implement your sign-in logic here
    String email = emailController.text;
    String password = passwordController.text;

    // You can add validation logic here before submitting the form

    // For now, just print the values
    print('Email: $email');
    print('Password: $password');
  }

  void _signInWithGoogle() {
    // Implement Google sign-in logic here
    print('Signing in with Google');
  }

  void _signInWithFacebook() {
    // Implement Facebook sign-in logic here
    print('Signing in with Facebook');
  }
}
