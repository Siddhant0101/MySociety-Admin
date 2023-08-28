import 'package:flutter/material.dart';

class VisitorParkingPage extends StatefulWidget {
  @override
  _VisitorParkingPageState createState() => _VisitorParkingPageState();
}

class _VisitorParkingPageState extends State<VisitorParkingPage> {
  int _selectedSlotIndex = -1;
  List<bool> _bookedSlots = [false, true, false, true, false, false];
  Map<int, String> _residents = {};

  void _selectSlot(int index) {
    setState(() {
      _selectedSlotIndex = index;
    });
  }

  void _bookSlot(int index, String? residentName) {
    setState(() {
      _bookedSlots[index] = true;
      _residents[index] = residentName!;
      _selectedSlotIndex = -1;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Parking slot booked successfully by $residentName!'),
        ),
      );
    });
  }

  void _removeSlot(int index) {
    setState(() {
      _bookedSlots[index] = false;
      _residents.remove(index); // remove the resident name for the given index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitor Parking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a parking slot',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: _bookedSlots.length,
              itemBuilder: (context, index) {
                bool isBooked = _bookedSlots[index];
                return Card(
                  color: isBooked ? Colors.grey : Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    onTap: isBooked ? null : () => _selectSlot(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        isBooked
                            ? InkWell(
                                onTap: () => _removeSlot(index),
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            if (_selectedSlotIndex != -1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _residents[_selectedSlotIndex] = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _bookSlot(
                        _selectedSlotIndex, _residents[_selectedSlotIndex]),
                    child: Text('Book slot'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
