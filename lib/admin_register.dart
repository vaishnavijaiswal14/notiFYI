import 'package:flutter/material.dart';
import 'package:my_notifyi/admin_home.dart';
import 'package:my_notifyi/admin_login.dart';
import 'package:my_notifyi/admin_password.dart'; // Assuming the correct import

// void main() {
//   runApp(RegisterApp());
// }

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotiFYI'),
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // App icon and name row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/Finalll_logo.png', // Replace with your icon image path
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Text('NotiFYI'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // TextFields with rounded borders
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Vaishnavi Jaiswal',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                    // TextField(
                    //   controller: _idController,
                    //   decoration: InputDecoration(
                    //     labelText: 'ID',
                    //     hintText: 'btbtc12345',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Implement your registration logic here
                        String name = _nameController.text;
                        // String id = _idController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String confirmPassword =
                            _confirmPasswordController.text;

                        // Print the values for testing
                        print('Name: $name');
                        // print('ID: $id');
                        print('Email: $email');
                        print('Password: $password');
                        print('Confirm Password: $confirmPassword');

                        // Display dialog box
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Registration Successful'),
                              content: Text('You are registered successfully.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: TextStyle(
                          fontSize: 18,
                        )
                      ),
                      child: Text('Register',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
