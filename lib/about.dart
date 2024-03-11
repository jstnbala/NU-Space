import 'package:flutter/material.dart';
import 'package:flutter_application_1/NavBar.dart';

class Aboutpage extends StatefulWidget {
  @override
  _AboutpageState createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
 
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      drawer: NavBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 56, 65, 142),
              ),
              height: height * 0.1,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (BuildContext scaffoldContext) => GestureDetector(
                        onTap: () {
                          Scaffold.of(scaffoldContext).openDrawer();
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                    ),
                    Text(
                      'NU SPACE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1), // Adjust bottom padding for space between images
                      child: Image.network('assets/images/about.png'), // Insert about.png image URL
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1), // Adjust bottom padding for space between images
                      child: Image.network('assets/images/mission.png'), // Insert mission.png image URL
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10), // Adjust bottom padding for space between images
                      child: Image.network('assets/images/vision.png'), // Insert vision.png image URL
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
