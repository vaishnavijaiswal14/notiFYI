//ogin
import 'package:flutter/material.dart';
import 'package:my_notifyi/admin_login.dart';
import 'package:my_notifyi/admin_password.dart';
import 'package:my_notifyi/admin_register.dart';
import 'package:my_notifyi/settings.dart';
import 'package:my_notifyi/signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    String? email; // Variable to store the entered email

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(95.0), // Adjust margin here
          padding: const EdgeInsets.all(15.0),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Finalll_logo.png',
                height: 50,
                width: 100,
              ), // Replace 'assets/logo.png' with the actual path to your logo image
              const SizedBox(height: 16),
              const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: "Email id",
                  hintText: '_sanskriti@banasthali.in',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  email = value; // Store the entered email
                },
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                obscureText: true, // This will obscure the text for password fields
                onChanged: (value) {
                  // do something
                },
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  // Navigate to Settings page and pass the email as a parameter
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                    arguments: {'email': email}, // Pass email as a parameter
                  );
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailInputPage(),
                    ),
                  );
                  // Add your forgot password navigation logic here
                },
                child: const Text('Forgot Password?'),
              ),

              // "Login as Admin" Button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginApp(),
                    ),
                  );
                },
                child: const Text('Login as Admin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

