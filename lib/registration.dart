import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A5299),
      appBar: AppBar(
        backgroundColor: Color(0xFF4A5299),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: NetworkImage("assets/images/registration.png"),
                  height: 200, // Adjust the height as needed
                ),
                SizedBox(height: 20),
                Text(
                  'Create your Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField('Full Name', Icons.person, fullNameController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                }),
                SizedBox(height: 20),
                _buildTextField('NU Email', Icons.email, emailController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@students.national-u.edu.ph')) {
                    return 'Please enter a valid NU email';
                  }
                  return null;
                }),
                SizedBox(height: 20),
                _buildPasswordField('Password', Icons.lock, passwordController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 8) {
                    return 'Must be at least 8 characters long';
                  } else if (!RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                    return 'Needs: 1 uppercase, 1 lowercase, 1 number, and 1 special character';
                  }
                  return null;
                }, showPassword, (value) {
                  setState(() {
                    showPassword = !showPassword;
                  });
                }),
                SizedBox(height: 20),
                _buildPasswordField('Confirm Password', Icons.lock, confirmPasswordController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                }, showConfirmPassword, (value) {
                  setState(() {
                    showConfirmPassword = !showConfirmPassword;
                  });
                }),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform registration here
                      // For demo purposes, display a snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Successful Registration'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFED41C),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF4A5299),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
    );
  }

  Widget _buildTextField(String hintText, IconData iconData, TextEditingController controller, FormFieldValidator<String> validator) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Color(0xFF4A5299),
            size: 24,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(String hintText, IconData iconData, TextEditingController controller, FormFieldValidator<String> validator, bool showPassword, Function(bool) toggleVisibility) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Color(0xFF4A5299),
            size: 24,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: !showPassword,
              validator: validator,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              toggleVisibility(!showPassword);
            },
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF4A5299),
            ),
          ),
        ],
      ),
    );
  }
}
