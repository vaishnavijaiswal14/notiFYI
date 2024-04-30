import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(100.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Image.asset('assets/Finalll_logo.png',
                  height: 50,
                  width: 100), // Replace 'assets/logo.png' with the actual path to your logo image
              // const SizedBox(height: 16),

              // const Text('Login',
              //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              // const SizedBox(height: 16),

              // Text(
              //   'Sign Up',
              //   style: TextStyle(
              //     fontSize: 24.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(height: 20.0),
              _buildCircularTextField("Name"),
              const SizedBox(height: 12.0),
              _buildCircularTextField("Email"),
              const SizedBox(height: 12.0),
              _buildCircularTextField("Password", isPassword: true),
              const SizedBox(height: 12.0),
              _buildCircularTextField("Confirm Password", isPassword: true),
              const SizedBox(height: 20.0),
              _buildSignUpButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularTextField(String hintText, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: () {
        _showSuccessMessage(context);
      },
      child: const Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('You have registered successfully!'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );

    // Navigate back to the login screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }
}
