import 'package:flutter/material.dart';

class CabDetailPage extends StatefulWidget {
  @override
  _CabDetailPageState createState() => _CabDetailPageState();
}

class _CabDetailPageState extends State<CabDetailPage> {
  TimeOfDay _time = TimeOfDay.now();
  String _vehicleNumber = '';

  void _addCabDetails() {
    // TODO: Implement adding cab details to the database
    print('Time: ${_time.format(context)}');
    print('Vehicle Number: $_vehicleNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cab Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Cab Details',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Time',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              InkWell(
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: _time,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _time = pickedTime;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' ${_time.format(context)}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Vehicle Number',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VehicleNumberBox(
                    onChanged: (value) {
                      setState(() {
                        _vehicleNumber = value;
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  VehicleNumberBox(
                    onChanged: (value) {
                      setState(() {
                        _vehicleNumber = value;
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  VehicleNumberBox(
                    onChanged: (value) {
                      setState(() {
                        _vehicleNumber = value;
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  VehicleNumberBox(
                    onChanged: (value) {
                      setState(() {
                        _vehicleNumber = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _addCabDetails();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Add Cab Details'),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Cab Details',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 3.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '${_time.format(context)}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Vehicle Number',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        _vehicleNumber.isNotEmpty ? _vehicleNumber : 'N/A',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
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

class VehicleNumberBox extends StatefulWidget {
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  const VehicleNumberBox({Key? key, this.onChanged, this.focusNode})
      : super(key: key);

  @override
  _VehicleNumberBoxState createState() => _VehicleNumberBoxState();
}

class _VehicleNumberBoxState extends State<VehicleNumberBox> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTextChanged() {
    if (_controller.text.length == 1 && widget.focusNode != null) {
      widget.focusNode!.nextFocus();
    }
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      height: 70.0,
      child: TextFormField(
        controller: _controller,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counter: Offstage(),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
