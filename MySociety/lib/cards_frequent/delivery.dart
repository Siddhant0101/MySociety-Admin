import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _deliveryDateController = TextEditingController();
  TextEditingController _deliveryTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Recipient Name"),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter recipient name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: "Delivery Address"),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter delivery address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _deliveryDateController,
                  decoration: InputDecoration(labelText: "Delivery Date"),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter delivery date";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _deliveryTimeController,
                  decoration: InputDecoration(labelText: "Delivery Time"),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter delivery time";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryDetailsPage(
                            name: _nameController.text,
                            address: _addressController.text,
                            deliveryDate: _deliveryDateController.text,
                            deliveryTime: _deliveryTimeController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeliveryDetailsPage extends StatelessWidget {
  final String name;
  final String address;
  final String deliveryDate;
  final String deliveryTime;

  DeliveryDetailsPage({
    required this.name,
    required this.address,
    required this.deliveryDate,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recipient Name: $name",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Delivery Address: $address",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Delivery Date: $deliveryDate",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Delivery Time: $deliveryTime",
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
