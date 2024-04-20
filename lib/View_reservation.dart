// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NavBar.dart';
import 'package:flutter_application_1/dashboard.dart';


class ViewReservationPage extends StatefulWidget{
  final String name;
  final String idno;
  final String? room;
  final String SelectedDate;
  final TimeOfDay time;

  const ViewReservationPage({super.key,   required this.name, required this.idno,  required this.room, required this.time, required this.SelectedDate});

  @override
  State<ViewReservationPage> createState() => _ViewReservationState();
}

class _ViewReservationState extends State<ViewReservationPage>{
  

  @override
  Widget build(BuildContext context){

    TextEditingController _Name = TextEditingController(text: widget.name);
    TextEditingController _idno = TextEditingController(text: widget.idno);
    TimeOfDay _time = widget.time;
    String _date = widget.SelectedDate;
    String? _room = widget.room;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
  
    return  Scaffold(
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

            //code here
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:  DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                 DataColumn(
                  label: Text(
                    'Student ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                 DataColumn(
                  label: Text(
                    'Student ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                 DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                DataColumn(
                  label: Text(
                    'Time In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
               rows: <DataRow>[
            

                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Justin Bala')),
                    DataCell(Text('2021-21402')),
                    DataCell(Text('Room 1')),
                    DataCell(Text('2024-03-22')),
                    DataCell(Text('7:30 AM')),
                  ],
                  ),

                DataRow(
                  cells: <DataCell>[
                     DataCell(Text('Myrna Viena')),
                    DataCell(Text('2022-24323')),
                    DataCell(Text('Room 3')),
                    DataCell(Text('2024-03-21')),
                    DataCell(Text('9:30 AM')),
                  ],
                  ), 

                  DataRow(
                  cells: <DataCell>[
                     DataCell(Text('Aikhen Patino')),
                    DataCell(Text('2021-09432')),
                    DataCell(Text('Room 2')),
                    DataCell(Text('2024-04-01')),
                    DataCell(Text('11:15 AM')),
                  ],
                  ), 

                  DataRow(
                  cells: <DataCell>[
                     DataCell(Text('Sharlene Chaingan')),
                    DataCell(Text('2021-95342')),
                    DataCell(Text('Room 1')),
                    DataCell(Text('2024-04-18')),
                    DataCell(Text('1:05 PM')),
                  ],
                  ), 

                  DataRow(
                  cells: <DataCell>[
                    DataCell(TextField(
                      readOnly: true,
                      controller: _Name,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                    DataCell(TextField(
                      readOnly: true,
                      controller: _idno,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                    DataCell(Text(
                      _room!,
                    )),
                    DataCell(Text(
                      _date,
                    )),
                    DataCell(Text(
                      '${_time.format(context)}'
                    )),
                  ],
                  ), 
               ],
               ),

              ),

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