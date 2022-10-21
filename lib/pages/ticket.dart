import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tixtix/pages/login.dart';
import 'package:tixtix/pages/sign_up.dart';
import 'package:tixtix/providers/ticket_provider.dart';
import 'package:tixtix/shared/theme.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kWhiteColor,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text(
              'Tabs Demo',
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

// class TicketPage extends StatefulWidget {
//   const TicketPage({Key? key}) : super(key: key);

//   @override
//   State<TicketPage> createState() => _TicketPageState();
// }

// class _TicketPageState extends State<TicketPage> {
//   //Widget untuk chip choice
//   int? _selectedIndex;
//   final List<String> _options = ['Satu arah', 'Pulang balik'];

//   @override
//   Widget build(BuildContext context) {
//     var hProv = Provider.of<TicketProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   color: kWhiteColor, borderRadius: BorderRadius.circular(5)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   for (var i = 0; i < _options.length; i++)
//                     Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: ChoiceChip(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 5),
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20))),
//                         selectedColor: kPrimaryColor,
//                         backgroundColor: kWhiteColor,
//                         selected: hProv.getSelectedIndex == i,
//                         label: Text(_options[i],
//                             style: whiteTextStyle.copyWith(
//                                 fontSize: 15, fontWeight: medium)),
//                         onSelected: (bool val) {
//                           if (val) {
//                             hProv.setSelectedIndex = i;
//                             print(_options[hProv.getSelectedIndex]);
//                           }
//                         },
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (_options[hProv.getSelectedIndex] == 'Satu arah')
//                   const Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Text('Ini satu arah')),
//                 if (_options[hProv.getSelectedIndex] == 'Pulang balik')
//                   const Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Text('Ini pulang balik')),
//               ],
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: kPrimaryColor,
//                 minimumSize: const Size.fromHeight(50),
//               ),
//               child: Text(
//                 'Pesan',
//                 style: whiteTextStyle,
//               ),
//               onPressed: () {
//                 if (_options[hProv.getSelectedIndex] == 'Satu arah') {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => SignUpPage()));
//                 } else {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => LoginPage()));
//                 }
//                 ;
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
