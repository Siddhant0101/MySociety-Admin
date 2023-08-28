import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // variables for user information
  String _name = 'Sidd Var';
  String _address = '120 sage heritage';
  String _phone = '8224000998';
  String _email = 'sidd@gmail.com';
  String _profilePicture = 'assets/images/profile_picture.png';

  // variables for family members
  List<String> _familyMembers = ['Jane Doe', 'Johnny Doe'];

  // variables for vehicle information
  List<String> _vehicles = ['Toyota Camry', 'Honda Civic'];

  // variables for notification settings
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _smsNotifications = false;

  // variables for security settings
  String _password = 'password';
  bool _twoFactorAuth = false;

  // variables for billing information
  String _paymentMethod = 'Visa ending in 1234';
  String _billingAddress = '1234 Main Street, Apt 2B';
  List<String> _paymentHistory = [
    '04/01/2023 - 100',
    '03/01/2023 - 100',
    '02/01/2023 - 100'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      // navigate to edit page
                      // or show a dialog to edit details
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(_profilePicture),
                            radius: 40,
                          ),
                          title: Text(
                            _name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(_address),
                              const SizedBox(height: 8),
                              Text(_phone),
                              const SizedBox(height: 8),
                              Text(_email),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // navigate to edit page
                              // or show a dialog to edit details
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Family Members',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  for (String member in _familyMembers)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(member),
                    ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vehicle Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  for (String vehicle in _vehicles)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(vehicle),
                    ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notification Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: _pushNotifications,
                        onChanged: (value) {
                          setState(() {
                            _pushNotifications = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text('Push Notifications'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _emailNotifications,
                        onChanged: (value) {
                          setState(() {
                            _emailNotifications = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text('Email Notifications'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _smsNotifications,
                        onChanged: (value) {
                          setState(() {
                            _smsNotifications = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text('SMS Notifications'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Security Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: _password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Change'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: _twoFactorAuth,
                        onChanged: (value) {
                          setState(() {
                            _twoFactorAuth = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text('Two-Factor Authentication'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Billing Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(_paymentMethod),
                  const SizedBox(height: 8),
                  Text(_billingAddress),
                  const SizedBox(height: 16),
                  const Text(
                    'Payment History',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (String payment in _paymentHistory)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(payment),
                    ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Support',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Contact Support'),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Version: _version',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Terms of Service',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
