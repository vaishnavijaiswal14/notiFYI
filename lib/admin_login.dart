import 'package:flutter/material.dart';
import 'package:my_notifyi/admin_home.dart';
import 'package:my_notifyi/admin_password.dart';
import 'package:my_notifyi/admin_register.dart';
import 'package:my_notifyi/login.dart';


//import 'package:notifyi/home_screen.dart'; // Assuming the correct import

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/Finalll_logo.png', // Replace with your icon image path
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Text('NotiFYI'), // Added app name
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: 400, // Fixed width
          height: 500, // Fixed height
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/Finalll_logo.png', // Replace with your icon image path
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: '@banasthali.in',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18,color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmailInputPage(),
                                ),
                              );
                              // Implement Forgot Password logic
                              print('Forgot Password?');
                            },
                            child: Text('Forgot Password?'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 120, // Reduced width for Register button
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // "Login as User" button as TextButton
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(), // Replace with the user's home screen
                            ),
                          );
                        },
                        child: Text(
                          'Login as User',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
