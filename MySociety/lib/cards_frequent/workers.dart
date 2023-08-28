import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkerDetails {
  final String workerType;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final DateTime date;

  WorkerDetails({
    required this.workerType,
    required this.startTime,
    required this.endTime,
    required this.date,
  });
}

class WorkerDetailsForm extends StatefulWidget {
  @override
  _WorkerDetailsFormState createState() => _WorkerDetailsFormState();
}

class _WorkerDetailsFormState extends State<WorkerDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<WorkerDetails> _workerDetailsList = [];

  String? _selectedWorkerType;
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );

    if (selectedTime != null) {
      setState(() {
        _startTime = selectedTime;
      });
    }
  }

  Future<void> selectEndTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        _endTime = selectedTime;
      });
    }
  }

  Widget _buildWorkerTypeDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Worker Type',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
      value: _selectedWorkerType,
      onChanged: (value) {
        setState(() {
          _selectedWorkerType = value;
        });
      },
      items: ['Plumber', 'Electrician', 'Carpenter', 'Gardener']
          .map((workerType) => DropdownMenuItem<String>(
                value: workerType,
                child: Text(workerType),
              ))
          .toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a worker type';
        }
        return null;
      },
    );
  }

  Widget _buildStartTimePicker() {
    return InkWell(
      onTap: () {
        _selectStartTime(context);
      },
      child: IgnorePointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Start Time',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.access_time),
          ),
          enabled: true,
          initialValue: DateFormat.Hm().format(DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              _startTime.hour,
              _startTime.minute)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a start time';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildEndTimePicker() {
    return InkWell(
      onTap: () {
        selectEndTime(context);
      },
      child: IgnorePointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'End Time',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.access_time),
          ),
          enabled: true,
          initialValue: DateFormat.Hm().format(DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              _endTime.hour,
              _endTime.minute)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select an end time';
            }
            return null;
          },
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final workerDetails = WorkerDetails(
        workerType: _selectedWorkerType!,
        startTime: _startTime,
        endTime: _endTime,
        date: _selectedDate,
      );

      setState(() {
        _workerDetailsList.add(workerDetails);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Worker details added'),
          duration: Duration(seconds: 2),
        ),
      );

      _formKey.currentState!.reset();
      _selectedWorkerType = null;
      _startTime = TimeOfDay.now();
      _endTime = TimeOfDay.now();
      _selectedDate = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Details Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Text(
                'Worker Details',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              _buildWorkerTypeDropdown(),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: _buildStartTimePicker(),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildEndTimePicker(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: IgnorePointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    enabled: true,
                    initialValue:
                        DateFormat.yMd().format(_selectedDate).toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Worker Details'),
              ),
              SizedBox(height: 32.0),
              Text(
                'Upcoming Workers',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _workerDetailsList.length,
                  itemBuilder: (context, index) {
                    final workerDetails = _workerDetailsList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person_4_sharp,
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            workerDetails.workerType,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            '${DateFormat.yMMMMd().format(workerDetails.date)} ${DateFormat.Hm().format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, workerDetails.startTime.hour, workerDetails.startTime.minute))} - ${DateFormat.Hm().format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, workerDetails.endTime.hour, workerDetails.endTime.minute))}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  //TODO: Implement edit function
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Edit Worker Details'),
                                        content:
                                            Text('TODO: Implement edit form'),
                                        actions: [
                                          TextButton(
                                            child: Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child: Text('SAVE'),
                                            onPressed: () {
                                              //TODO: Implement save function
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  //TODO: Implement delete function
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Confirm Deletion'),
                                        content: Text(
                                            'Are you sure you want to delete this worker detail?'),
                                        actions: [
                                          TextButton(
                                            child: Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child: Text('DELETE'),
                                            onPressed: () {
                                              setState(() {
                                                _workerDetailsList
                                                    .removeAt(index);
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
