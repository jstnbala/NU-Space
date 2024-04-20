import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/View_reservation.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/NavBar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
List<DateTime?> _dates = [
  DateTime.now(),
];

List<DateTime?> _singleDatePickerValueWithDefaultValue = [
  DateTime.now(),
];

class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<Reservation> createState() => ReservationState();
}



class ReservationState extends State<Reservation> {
  String? selectedAccountType;
  String? selectedDepartment;
  String dropdownValue = list.first;
  TimeOfDay time =TimeOfDay(hour: 7, minute: 30);
  TimeOfDay time2 =TimeOfDay(hour: 8, minute: 30);

  final Name = new TextEditingController();
  final ID = new TextEditingController();

  late String SelectedDate;



  @override
  Widget build(BuildContext context)
  {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


  
 String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }
  
Widget _buildDefaultSingleDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      selectedDayHighlightColor: Color.fromARGB(255, 56, 65, 142),
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Color.fromARGB(255, 56, 65, 142),
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      selectableDayPredicate: (day) => !day
          .difference(DateTime.now().subtract(const Duration(days: 3)))
          .isNegative,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        CalendarDatePicker2(
          config: config,
          value: _singleDatePickerValueWithDefaultValue,
          onValueChanged: (dates) =>
              setState(() => _singleDatePickerValueWithDefaultValue = dates),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Date Selected:  '),
            const SizedBox(width: 10),
            Text(
              SelectedDate = _getValueText(
                config.calendarType,
                _singleDatePickerValueWithDefaultValue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }

     return Scaffold(
      drawer: NavBar(),  // Set NavBar as the drawer
      body: SafeArea(
        child: SingleChildScrollView(
        child:  Column(
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

            _buildDefaultSingleDatePickerWithValue(),
           
           
            
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
              
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
             
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
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16), // Add padding to the text
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
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 16),
                            width: 130,
                            height: 320,
                           
                            child:  Column(
                              children: [

                                   Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                                    child: TextField(
                                      controller: Name,
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
                                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when not focused
                                        ),
                                      ),

                                      style: TextStyle(
                                        fontSize: 13,
                                          color: Color.fromARGB(255, 255, 255, 255), // Text color
                                        ),
                                    ),
                                  ),


                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
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
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                                     Padding(
                                       padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                                      child: TextField(
                                        controller: ID,
                                      
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
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),

                                     Padding(
  
                                     padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
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
                                            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Bottom line color when not focused
                                          ),
                                        
                                        ),

                                        style: TextStyle(
                                          fontSize: 13,
                                            color: Color.fromARGB(255, 255, 255, 255), // Text color
                                          ),
                                          
                                      ),
                                    ),


                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                             width: 190,
                            height: 320,
                           
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
                            Icons.school,
                            color: Color.fromARGB(255, 189, 189, 189), // Text color
                            size: 18,
                          ),
                          SizedBox(width: 7),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 189, 189, 189), // Text color
                                ),
                                value: selectedDepartment,
                                onChanged: (String? value2) {
                                  setState(() {
                                    selectedDepartment = value2;
                                  });
                                },
                                items: [
                                  'CCIT',
                                  'COA',
                                  'CBA',      
                                  'CEAS',
                                  'COE',
                                  'CTHM',
                                ].map<DropdownMenuItem<String>>(
                                  (String value2) {
                                    return DropdownMenuItem<String>(
                                      value: value2,
                                      child: Text(
                                        value2,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(255, 255, 255, 255), // Text color
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                                dropdownColor: const Color(0xFF4A5299), // White background
                                style: TextStyle(
                                  color: Color(0xFF4A5299), // Text color
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                hint: Text(
                                  'Department',
                                  style: TextStyle(
                                    fontSize: 13,
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

                                    Padding(
                                      padding: EdgeInsets.fromLTRB(18,40, 10 ,10),
                                      child: Row(
                                      children: [

                                         ElevatedButton(
                                              child: Text('Time In',
                                                style: TextStyle(
                                                  fontSize: 12
                                                ),
                                                
                                              
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                
                                                shape: BeveledRectangleBorder(
                                                  borderRadius: BorderRadius.zero,
                                                )
                                              ),
                                              onPressed: () async{
                                                
                                                TimeOfDay? newTime = await showTimePicker(
                                                  context: context, 
                                                  initialTime: time
                                                  );

                                                  if (newTime == null )   return;

                                                  setState(() => time = newTime);
                                                  
                                              },
                                            ),
                                          const SizedBox(height: 2),
                                          Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1.0,
                                                    color: Colors.white,
                                                  ),
                                                 
                                                 
                                                ),
                                                child: Padding(
                                                padding: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                                child:    Text(
                                                time.format(context).toString(),
                                                
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),  
                                              ),
                                          ),
                                         
                                           
                                         
                                      ],
                                    ),       
                                   
                                    ),

                                     Padding(
                                      padding: EdgeInsets.fromLTRB(18,10, 10 ,30),
                                      child: Row(
                                      children: [

                                         ElevatedButton(
                                              child: Text('Time Out',
                                                style: TextStyle(
                                                  fontSize: 12
                                                ),
                                              
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.fromLTRB(19, 10, 19, 10),
                                                shape: BeveledRectangleBorder(
                                          
                                                  borderRadius: BorderRadius.zero,
                                                )
                                              ),
                                              onPressed: () async{
                                                TimeOfDay? newTime2 = await showTimePicker(
                                                  context: context, 
                                                  initialTime: time2
                                                  );

                                                  if (newTime2 == null )   return;

                                                  setState(() => time2 = newTime2);
                                              },
                                            ),
                                          const SizedBox(height: 2),
                                          Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1.0,
                                                    color: Colors.white,
                                                  ),
                                                 
                                                 
                                                ),
                                                child: Padding(
                                                padding: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                                child:    Text(
                                                time2.format(context).toString(),
                                                
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),  
                                              ),
                                          ),
                                         
                                           
                                         
                                      ],
                                    ),       
                                   
                                    ),

                            
                                  
                                            Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16),
                                          
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                            
                                                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                            Icons.room,
                            color: Color.fromARGB(255, 189, 189, 189), // Text color
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 189, 189, 189), // Text color
                                ),
                                value: selectedAccountType,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedAccountType = value;
                                  });
                                },
                                items: [
                                  'Room 1',
                                  'Room 2',
                                  'Room 3',
                                  'Room 4',
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(255, 255, 255, 255), // Text color
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                                dropdownColor: const Color(0xFF4A5299), // White background
                                style: TextStyle(
                                  color: Color(0xFF4A5299), // Text color
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                hint: Text(
                                  'Select Room',
                                  style: TextStyle(
                                    fontSize: 13,
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
                          // Navigate to the TestPage
                          var route = MaterialPageRoute(
                            builder: (BuildContext context) =>
                                  ViewReservationPage(name: Name.text, idno: ID.text, room: selectedAccountType, time: time, SelectedDate: SelectedDate),
                          );
                          Navigator.of(context).push(route);
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
                    margin: EdgeInsets.fromLTRB(5, 20, 30, 0),
                    width: 111,
                    height: 50,
                    decoration: ShapeDecoration(
                    color: Color(0xFFFED41C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),

                     child:  ElevatedButton(
                      onPressed: () {
                        // Handle button press
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Center(
                              child:Text('Reserved')),
                            
                            actions: [
                              Center(
                                child: TextButton(
                                child: Text('ok'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              ),
                           
                            ],
                          )
                          );
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
                margin: EdgeInsets.fromLTRB(10, 20, 30,20),
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
        ),
       
      );
      

      
 }
}
