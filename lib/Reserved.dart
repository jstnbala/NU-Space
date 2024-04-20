import 'package:flutter/material.dart';
import 'package:flutter_application_1/NavBar.dart';
import 'package:flutter_application_1/dashboard.dart';

class ReservedPage extends StatelessWidget {
  const ReservedPage({super.key});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer:NavBar(),
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
                    const Text(
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
               child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Successfuly Reserved!',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                  onPressed: () {
                    // Add any actions you want to perform
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dashboard(),
                              ),
                            );
                  },
                  child: const Text('Back'),
                  ),
          ],
        ),

              )


            



          ],
        ),
      ),
    );
  }
}
