//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Placeholder for selected account type
  String? selectedAccountType;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A5299),
      body: Column(
        children: [
          Container(
            height: 250,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // Centered Dropdown menu with adjusted padding
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // White background
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Color(0xFF4A5299), // Text color
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFF4A5299), // Text color
                                ),
                                value: selectedAccountType,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedAccountType = value;
                                  });
                                },
                                items: [
                                  'Student',
                                  'Faculty',
                                  'Staff',
                                  'Alumni',
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: Color(0xFF4A5299), // Text color
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                                dropdownColor: Colors.white, // White background
                                style: TextStyle(
                                  color: Color(0xFF4A5299), // Text color
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                hint: Text(
                                  'Select Account Type',
                                  style: TextStyle(
                                    color: Colors.grey, // Gray hint text color
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
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
                SizedBox(height: 25),
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
                          // Add functionality for Forgot Password link
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Color(0xFFFED41C), // Forgot Password text color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                // Login Button
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for Login button
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
                SizedBox(height: 25),

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
                          // Add functionality for registration link
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
                    padding: EdgeInsets.only(top: 10, bottom: 5),  // Adjust the top and bottom padding as needed
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                ),
                // Footer
                ListView(
                  shrinkWrap: true,
                  children: [
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
    );
  }
}
