import 'package:flutter/material.dart';
import 'package:startertemplate/pages/profile_page.dart';
import 'package:startertemplate/pages/visitorParking.dart';

import '../cards_frequent/cab.dart';
import '../cards_frequent/delivery.dart';
import '../cards_frequent/guests.dart';
import '../cards_frequent/workers.dart';

class SocietyDashboard extends StatelessWidget {
  const SocietyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22),
            // Society Metrics
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     'Society Metrics',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20.0,
            //     ),
            //   ),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // _MetricCard(
                  //   title: 'Residents',
                  //   count: 500,
                  //   icon: Icons.people,
                  //   color: Colors.green,
                  // ),
                  _MetricCard(
                    title: 'Frequent Visitors',
                    count: 5,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return FloatingForm(
                            options: [
                              FloatingOption(
                                icon: Icons.people,
                                label: 'Guests',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GuestPage()),
                                  );
                                },
                              ),
                              FloatingOption(
                                icon: Icons.taxi_alert_rounded,
                                label: 'Cab',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CabDetailPage()),
                                  );
                                },
                              ),
                              FloatingOption(
                                icon: Icons.person_2_outlined,
                                label: 'Worker',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WorkerDetailsForm()),
                                  );
                                },
                              ),
                              FloatingOption(
                                icon: Icons.delivery_dining,
                                label: 'Delivery',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DeliveryPage()),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icons.person_add_alt_1,
                    color: Colors.orange,
                  ),
                  _MetricCard(
                    title: 'Daily Visitors',
                    count: 5,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return FloatingForm(
                            options: [
                              FloatingOption(
                                icon: Icons.people,
                                label: 'Guests',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GuestPage()),
                                  );
                                },
                              ),
                              FloatingOption(
                                icon: Icons.taxi_alert_rounded,
                                label: 'Cab',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CabDetailPage()),
                                  );
                                },
                              ),
                              FloatingOption(
                                icon: Icons.person_2_outlined,
                                label: 'Worker',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WorkerDetailsForm()),
                                  );
                                },
                              ),
                              FloatingOption(
                                icon: Icons.delivery_dining,
                                label: 'Delivery',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Page3()),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icons.people,
                    color: Colors.deepOrange,
                  ),
                  _MetricCard(
                    title: 'Security Staff',
                    count: 10,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return FloatingForm(
                            options: [
                              FloatingOption(
                                icon: Icons.dashboard,
                                label: 'Page 1',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Page1()),
                                  );
                                },
                              ),
                              FloatingOption(
                                icon: Icons.account_circle,
                                label: 'Page 2',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Page2()),
                                  );
                                },
                              ),
                              FloatingOption(
                                icon: Icons.settings,
                                label: 'Page 3',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Page3()),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icons.security_outlined,
                    color: Colors.red,
                  ),
                ],
              ),
            ),

            // Parking Availability
            // Padding(
            //   padding: const EdgeInsets.all(26.0),
            //   child: Text(
            //     'Parking Availability',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 24.0,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showMaidStatusDialog(context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maid',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Color(0xFF1E2432),
                          ),
                        ),
                        Text(
                          maidStatus,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: maidStatus == 'In'
                                ? Color(0xFF45D09E)
                                : Color.fromARGB(255, 220, 80, 70),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VisitorParkingPage()),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Visitors Parking',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: Color(0xFF1E2432),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xFFA9A9A9),
                              size: 16.0,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '5',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                                color: Color(0xFF45D09E),
                              ),
                            ),
                            Text(
                              '/10',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                color: Color(0xFFA9A9A9),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 15),

            // Maintenance Due
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maintenance Due',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Colors.red.shade300),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Your maintenance is due on May 30th',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Pay Now'),
                  ),
                ],
              ),
            ),

            // Recent Announcements
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Announcements',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  _AnnouncementCard(
                    title: 'Annual General Meeting',
                    subtitle: 'May 15th, 2023 at 3:00pm',
                    icon: Icons.event,
                  ),
                  SizedBox(height: 8.0),
                  _AnnouncementCard(
                    title: 'New Parking Policy',
                    subtitle: 'Effective June 1st, 2023',
                    icon: Icons.local_parking,
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('View All Announcements'),
                  ),
                ],
              ),
            ),

            // Upcoming Events
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Events',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  _EventCard(
                    title: 'Summer Picnic',
                    subtitle: 'July 10th, 2023 at 12:00pm',
                    icon: Icons.emoji_food_beverage,
                  ),
                  SizedBox(height: 8.0),
                  _EventCard(
                    title: 'Fitness Bootcamp',
                    subtitle: 'Every Saturday at 7:00am',
                    icon: Icons.fitness_center,
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('View All Events'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingForm extends StatelessWidget {
  final List<FloatingOption> options;

  const FloatingForm({Key? key, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Choose the Visitor for pre-approval:',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
          SizedBox(height: 30),
          Wrap(
            spacing: 12,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: options,
          ),
        ],
      ),
    );
  }
}

class FloatingOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const FloatingOption(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.cyan.shade400,
              size: 30,
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.blueGrey[900]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MetricCard({
    Key? key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        padding: EdgeInsets.all(12.0),
        width: 170.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: color,
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '$count',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnnouncementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _AnnouncementCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 48.0,
            color: Colors.blue,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _EventCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 48.0,
            color: Colors.orange,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Text('This is Page 1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Text('This is Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Text('This is Page 3'),
      ),
    );
  }
}

String maidStatus = 'In';

void _showMaidStatusDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Maid Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('In'),
              textColor: Colors.green,
              onTap: () {
                maidStatus = 'In';
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Out'),
              textColor: Colors.red,
              onTap: () {
                maidStatus = 'Out';
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
