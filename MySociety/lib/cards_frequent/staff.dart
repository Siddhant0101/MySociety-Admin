// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Modern Dashboard',
//       home: DashboardPage(),
//     );
//   }
// }

// class StaffPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text('Modern Dashboard'),
//         backgroundColor: Colors.blue[800],
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select a card to open the form:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   DashboardCard(
//                     color: Colors.blue[800],
//                     label: 'Card 1',
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return FloatingForm(
//                             options: [
//                               FloatingOption(
//                                 icon: Icons.dashboard,
//                                 label: 'Page 1',
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => Page1()),
//                                   );
//                                 },
//                               ),
//                               FloatingOption(
//                                 icon: Icons.account_circle,
//                                 label: 'Page 2',
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => Page2()),
//                                   );
//                                 },
//                               ),
//                               FloatingOption(
//                                 icon: Icons.settings,
//                                 label: 'Page 3',
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => Page3()),
//                                   );
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   DashboardCard(
//                     color: Colors.green[800],
//                     label: 'Card 2',
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return FloatingForm(
//                             options: [
//                               FloatingOption(
//                                 icon: Icons.dashboard,
//                                 label: 'Page 1',
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => Page1()),
//                                   );
//                                 },
//                               ),
//                               FloatingOption(
//                                 icon: Icons.account_circle,
//                                 label: 'Page 2',
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => Page2()),
//                                   );
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   DashboardCard(
//                     color: Colors.red[800],
//                     label: 'Card 3',
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return FloatingForm(
//                             options: [
//                               FloatingOption(
//                                 icon: Icons.dashboard,
//                                 label: 'Page 1',
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => Page1()),
//                                   );
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DashboardCard extends StatelessWidget {
//   final Color? color;
//   final String label;
//   final VoidCallback onTap;

//   const DashboardCard(
//       {Key? key, required this.color, required this.label, required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 150,
//         height: 200,
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.dashboard,
//               color: Colors.white,
//               size: 50,
//             ),
//             SizedBox(height: 20),
//             Text(
//               label,
//               style: TextStyle(fontSize: 20, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FloatingForm extends StatelessWidget {
//   final List<FloatingOption> options;

//   const FloatingForm({Key? key, required this.options}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Select an option:',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: options,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FloatingOption extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onTap;

//   const FloatingOption(
//       {Key? key, required this.icon, required this.label, required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Icon(
//             icon,
//             color: Colors.blue[800],
//             size: 50,
//           ),
//           SizedBox(height: 10),
//           Text(
//             label,
//             style: TextStyle(fontSize: 16, color: Colors.blue[800]),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Page1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page 1'),
//         backgroundColor: Colors.blue[800],
//       ),
//       body: Center(
//         child: Text('This is Page 1'),
//       ),
//     );
//   }
// }

// class Page2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page 2'),
//         backgroundColor: Colors.blue[800],
//       ),
//       body: Center(
//         child: Text('This is Page 2'),
//       ),
//     );
//   }
// }

// class Page3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page 3'),
//         backgroundColor: Colors.blue[800],
//       ),
//       body: Center(
//         child: Text('This is Page 3'),
//       ),
//     );
//   }
// }
