import 'package:flutter/material.dart';
import 'package:flutter_application_1/about.dart';
import 'package:flutter_application_1/feedback.dart';
import 'package:flutter_application_1/login_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFED41C), // Set the golden yellow background color
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Logo and System Title "NU SPACE"
            ListTile(
              contentPadding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              leading: Image.asset(
                'assets/images/LOGO.png',
                width: 40, // Adjust the width as needed
                height: 40, // Adjust the height as needed
              ),
              title: const Text(
                'NU SPACE',
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 31, 78),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins', // Set Poppins font
                ),
              ),
            ),

            // New container for profile photo and user name
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 1, 31, 78), // Circle outline color
                        width: 5, // Adjust the outline width as needed
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Set shadow color and opacity
                          spreadRadius: 5, // Set the spread radius
                          blurRadius: 10, // Set the blur radius
                          offset: Offset(0, 3), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'AKO SI BATMAN.', // Replace with the actual user name
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins', // Set Poppins font
                    ),
                  ),
                ],
              ),
            ),
            // Padding added to the first divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Color.fromARGB(255, 1, 31, 78), // Set blue color for the divider
                thickness: 3.0, // Increase the thickness of the divider
              ),
            ),
            
            // Card for SEND FEEDBACK
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8), // Adjust vertical padding as needed
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Adjust the border radius as needed
                ),
                color: Color.fromARGB(100, 1, 31, 78), // Set color with low opacity
                child: ListTile(
                  leading: const Icon(
                    Icons.feedback,
                    color: Color.fromARGB(255, 1, 31, 78), // Set the icon color to white or any other color that fits the design
                  ),
                  title: const Text(
                    'SEND FEEDBACK',
                    style: TextStyle(
                      color: Colors.white, // Set the text color to white or any other color that fits the design
                      fontFamily: 'Poppins', // Set Poppins font
                    ),
                  ),
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackPage()), // Navigate to FeedbackPage
                    );
                  },
                ),
              ),
            ),

            // Card for ABOUT NU SPACE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8), // Adjust vertical padding as needed
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Adjust the border radius as needed
                ),
                color: Color.fromARGB(100, 1, 31, 78), // Set color with low opacity
                child: ListTile(
                  leading: const Icon(
                    Icons.details,
                    color: Color.fromARGB(255, 1, 31, 78), // Set the icon color to white or any other color that fits the design
                  ),
                  title: const Text(
                    'ABOUT NU SPACE',
                    style: TextStyle(
                      color: Colors.white, // Set the text color to white or any other color that fits the design
                      fontFamily: 'Poppins', // Set Poppins font
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => Aboutpage()), // Navigating to the AboutPage
                     );
                   },
                ),
              ),
            ),
            // Padding added to the first divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Color.fromARGB(255, 1, 31, 78), // Set blue color for the divider
                thickness: 3.0, // Increase the thickness of the divider
              ),
            ),
            // Padding added above the logout button
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Container(
                margin: EdgeInsets.only(left: 179, right: 25), // Adjusted left margin
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality for Logout button
                    Navigator.pop(context); // Close the drawer
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())); // Navigate to LoginPage and replace the current route
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Set background color for the button
                    padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the horizontal padding as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // Set the border radius as needed
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white, // Set the icon color to white or any other color that fits the design
                        ),
                        SizedBox(width: 5),
                        Text(
                            'LOGOUT',
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 13,
                              fontWeight: FontWeight.bold, // Make the text bold
                              fontFamily: 'Poppins', // Set Poppins font
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
