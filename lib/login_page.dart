// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'forgotpass.dart';
import 'registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool rememberMe = false;

  // Predefined valid credentials
  final String validEmail = "batman@students.national-u.edu.ph";
  final String validPassword = "@Batman17";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A5299),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 270,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    width: 393,
                    height: 252,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("assets/images/confroom.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xFF4A5299).withOpacity(0.5),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 307,
                      height: 106,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("assets/images/NU Space Logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Add Welcome Nationalian! text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Welcome Nationalian!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.5),
                  Text(
                    'Secure your space by signing in',
                    style: TextStyle(
                      color: Color(0xFFFED41C),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Email field design with bold hint text
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white, // White background
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Color(0xFF4A5299), // Text color
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Type your NU Email here',
                              hintStyle: TextStyle(
                                color: Colors.grey, // Gray hint text color
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color(0xFF4A5299), // Text color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // Password field design with gray hint text and show/hide password icon
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white, // White background
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Color(0xFF4A5299), // Text color
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: passwordController,
                            obscureText: !showPassword,
                            decoration: InputDecoration(
                              hintText: 'Type here your password',
                              hintStyle: TextStyle(
                                color: Colors.grey, // Gray hint text color
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color(0xFF4A5299), // Text color
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xFF4A5299), // Text color
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  // Remember me checkbox and Forgot Password link
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                              checkColor: Colors.white,
                              activeColor: Color(0xFF4A5299),
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(right: 16),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPass()),
                            );
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Color(0xFFFED41C),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  // Login Button
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    child: ElevatedButton(
                      onPressed: () {
                        String enteredEmail = emailController.text.trim();
                        String enteredPassword = passwordController.text.trim();

                        // Check if the fields are empty
                        if (enteredEmail.isEmpty || enteredPassword.isEmpty) {
                          // Show reminder message if fields are empty
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Reminder"),
                                content: Text("Email and password fields are required."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (!rememberMe) {
                          // Show reminder message if "Remember Me" is not checked
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Reminder"),
                                content: Text("Please check 'Remember Me' to proceed."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Check if entered credentials match the valid credentials
                          if (enteredEmail == validEmail && enteredPassword == validPassword) {
                            // Navigate to Dashboard if credentials are valid
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Dashboard()),
                            );
                          } else {
                            // Show error message for invalid credentials
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Invalid Credentials"),
                                  content: Text("Please enter valid email and password."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFED41C), // Button color
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Color(0xFF4A5299), // Text color
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Make the text bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Additional Text
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegistrationPage()),
                            );
                          },
                          child: Text(
                            'Click here to Register.',
                            style: TextStyle(
                              color: Color(0xFFFED41C),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Horizontal Line with Padding
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 5),  // Adjust the top and bottom padding as needed
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ),
                  // Footer
                  ListView(
                    shrinkWrap: true,
                    children: const [
                      SizedBox(
                        height: 60, // Adjust the height as needed
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'All contents and services provided within this system are',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12, // Adjust the font size as needed
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'intended exclusively for Nationalians\' use',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12, // Adjust the font size as needed
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'National University © 2023',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12, // Adjust the font size as needed
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
