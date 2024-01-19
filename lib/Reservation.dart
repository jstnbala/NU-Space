import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/NavBar.dart';

class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<Reservation> createState() => ReservationState();
}



class ReservationState extends State<Reservation> {
  
  @override
  Widget build(BuildContext context)
  {
     String? selectedAccountType;
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


            Container(
              margin: const EdgeInsets.fromLTRB(10, 190, 10, 10),
              width: 500,
              height: 472,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 56, 65, 142),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
              child: Center(
                child: Column(
                  children: [

                    const Padding(
                      padding: EdgeInsets.all(16.0), // Add padding to the text
                      child: Text(
                        'RESERVATION INFORMATION',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),

                    Row(
                      children: [
                           Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            width: 220,
                            height: 400,
                           
                            child: Column(
                              children: [

                                   const Padding(
                                    padding: EdgeInsets.fromLTRB(16,0,16,0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        
                                        hintText: 'FullName',
                                        hintStyle: TextStyle(
                                            color: Colors.grey, // Gray hint text color
                                          ),
                                        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Optional: Change label color
                                        focusedBorder: UnderlineInputBorder(
                        
                                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when focused
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey), // Bottom line color when not focused
                                        ),
                                      ),

                                      style: TextStyle(
                                        fontSize: 13,
                                          color: Color.fromARGB(255, 255, 255, 255), // Text color
                                        ),
                                    ),
                                  ),


                                    const Padding(
                                        padding: EdgeInsets.fromLTRB(16,0,16,0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, // Gray hint text color
                                            ),
                                          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Optional: Change label color
                                          focusedBorder: UnderlineInputBorder(
                          
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when focused
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                                     const Padding(
                                        padding: EdgeInsets.fromLTRB(16,0,16,0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          
                                          hintText: 'ID No.',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, // Gray hint text color
                                            ),
                                          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Optional: Change label color
                                          focusedBorder: UnderlineInputBorder(
                          
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when focused
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                                     const Padding(
                                        padding: EdgeInsets.fromLTRB(16,0,16,0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          
                                          hintText: 'Contact No.',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, // Gray hint text color
                                            ),
                                          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Optional: Change label color
                                          focusedBorder: UnderlineInputBorder(
                          
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when focused
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                                  

                                    Padding(
                                        padding: EdgeInsets.fromLTRB(16,30,16,0),
                                      child: TextField(
                                          
                                          decoration: InputDecoration(
                                            hintText: '',
                                            hintStyle: TextStyle(
                                              color: Colors.grey, // Gray hint text color
                                            ),
                                          
                                            labelText: 'PURPOSE ACTIVITY', // Optional: Add a label
                                            labelStyle: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(255, 255, 255, 255),
                                            ), // Optional: Change label color
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                
                                                color: Color.fromARGB(255, 255, 255, 255),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0), // Adjust the radius for rounded corners
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                              
                                                color: Colors.grey,
                                              ),
                                              borderRadius: BorderRadius.circular(10.0), // Adjust the radius for rounded corners
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                             width: 220,
                            height: 400,
                           

                        child: Column(
                            children: [
                              //role type 
                                            Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16),
                                          
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                            
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
                                                'CCIT',
                                                'CTHM',
                                                'COE',
                                                'COA',
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
                                                'Department',
                                                style: TextStyle(
                                                  color: const Color.fromARGB(255, 192, 192, 192), // Gray hint text color
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                          const Padding(
                                        padding: EdgeInsets.fromLTRB(16,0,16,0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          
                                          hintText: 'Duration',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, // Gray hint text color
                                            ),
                                          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Optional: Change label color
                                          focusedBorder: UnderlineInputBorder(
                          
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when focused
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                                    const Padding(
                                        padding: EdgeInsets.fromLTRB(16,0,16,0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          
                                          hintText: 'Time-In',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, // Gray hint text color
                                            ),
                                          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Optional: Change label color
                                          focusedBorder: UnderlineInputBorder(
                          
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when focused
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                                    const Padding(
                                        padding: EdgeInsets.fromLTRB(16,0,16,0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          
                                          hintText: 'Time-Out',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, // Gray hint text color
                                            ),
                                          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Optional: Change label color
                                          focusedBorder: UnderlineInputBorder(
                          
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when focused
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                                            Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16),
                                          
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                            
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
                                                'TABLES',
                                                'COUCHES',
                                      
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
                                                'FURNITURE',
                                                style: TextStyle(
                                                  color: const Color.fromARGB(255, 192, 192, 192), // Gray hint text color
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),




                          ],//EJD OF COLUMN
                          
                        ),
                    ),


                      ],
                    ),

                   
                   


                  ],
    
                ),
              ),
            ),


            Row(
              children: [
               
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 30, 0),
                    width: 200,
                    height: 50,
                    decoration: ShapeDecoration(
                    color: Color(0xFFFED41C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),

                    child:  ElevatedButton(
                      onPressed: () {
                        // Handle button press
                        print('Button Pressed!');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFED41C), // Background color of the button
                        onPrimary: Colors.black, // Text color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                        padding: EdgeInsets.all(16.0), // Padding around the button text
                      ),
                      child: const Text(
                        'VIEW RESERVATIONS',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          ),
                       

                      ),
                    ),
                ),
                

                Container(
                    margin: EdgeInsets.fromLTRB(115, 20, 30, 0),
                    width: 111,
                    height: 50,
                    decoration: ShapeDecoration(
                    color: Color(0xFFFED41C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),

                     child:  ElevatedButton(
                      onPressed: () {
                        // Handle button press
                        print('Button Pressed!');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFED41C), // Background color of the button
                        onPrimary: Colors.black, // Text color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                        padding: EdgeInsets.all(16.0), // Padding around the button text
                      ),
                      child: const Text(
                        'RESERVE',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          ),
                       

                      ),
                    ),
                )

              ],
            ),
      
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 30, 0),
                width: 111,
                height: 50,
                decoration: ShapeDecoration(
                    color: Color(0xFF4A5299),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),

                 child:  ElevatedButton(
                       onPressed: () {
                      // Add functionality for Login button
                  
                        // Navigate to the TestPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ),
                        );
                  
                    },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4A5299), // Background color of the button
                        onPrimary: const Color.fromARGB(255, 255, 255, 255), // Text color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                        padding: EdgeInsets.all(16.0), // Padding around the button text
                      ),
                      child: const Text(
                        'BACK',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          ),
                       

                      ),
                    ),
            )



          ],
        ),
        ),
       
      );
 }
}
