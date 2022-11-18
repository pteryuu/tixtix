// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class AccountPage extends StatefulWidget {
//   const AccountPage({super.key});

//   @override
//   State<AccountPage> createState() => _AccountPageState();
// }

// class _AccountPageState extends State<AccountPage> {
//   @override
//   Widget build(BuildContext context) {
//     List<Item> _books = generateItems(8);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(top: 80),
//           child: _buildPanel(),
//         ),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _books[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _books.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//             title: Text(item.expandedValue),
//           ),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }

// // stores ExpansionPanel state information
// class Item {
//   Item({
//     required this.expandedValue,
//     this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Book $index',
//       expandedValue: 'Details for Book $index goes here',
//     );
//   });
// }
