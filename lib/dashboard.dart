import 'package:flutter/material.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/Reservation.dart';
import 'package:flutter_application_1/NavBar.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: NavBar(),  // Set NavBar as the drawer
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
                          // Open the drawer when menu icon is tapped
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
            

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Howdy, Nationalians!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [

            GestureDetector(
                      onTap: () {
                        // Navigate to the TestPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Reservation(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 335.0,
                        height: 260.0,
                        child: Card(
                          color: Color.fromARGB(255, 56, 65, 142),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: -30.0,
                                top: -25.0,
                                child: Image.asset(
                                  'assets/images/calendar.png',
                                  width: 100.0,
                                  height: 100.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 140.0),
                                    Text(
                                      'Reservation',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Text(
                                      'Page',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        // Navigate to the TestPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestPage(),
                          ),
                        );
                      },
                      child:SizedBox(
                    width: 335.0,
                    height: 260.0,
                    child: Card(
                      color: Color.fromARGB(255, 56, 65, 142),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none, // Set clipBehavior to none
                        children: [
                          Positioned(
                            left: -30.0, // Adjust the left position to place it outside the Card
                            top: -25.0, // Adjust the top position to place it above the Card
                            child: Image.asset(
                              'assets/images/reserved.png',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 12.0, 12.0, 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                              children: [
                                SizedBox(height: 140.0),
                                Text(
                                  'Reservation Info of Students and Staff',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                    
            ElevatedButton(
              onPressed: () {
                // Navigate to the LoginPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 254, 212, 28),
                fixedSize: Size(335.0, 50.0),
              ),
              child: Text(
                'LOGOUT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                    fontFamily: 'Poppins',
                ),
              ),
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
