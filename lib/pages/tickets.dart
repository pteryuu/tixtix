import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixtix/pages/widgets/ticket.dart';
import 'package:tixtix/providers/active_ticket_provider.dart';
import 'package:tixtix/shared/theme.dart';

import '../consts/data.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final List<Tab> _tabs = const <Tab>[
    Tab(
      child: Text(
        'TIKET AKTIF',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    Tab(
      child: Text(
        'DAFTAR TRANSAKSI',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    )
    // Tab(icon: Icon(Icons.directions_bike)),
  ];

  @override
  void initState() {
    super.initState();
    // _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(horizontal: 8),
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.account_circle_outlined)),
          title: Text(
            'TIXTIX',
            style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.notifications))
          ],
          bottom: TabBar(
            labelColor: kBlackColor,
            unselectedLabelColor: kGreyColor,
            tabs: _tabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const TicketCategories(),
                  const SizedBox(height: 8,),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: tickets.map((e) {
                          return Ticket(
                            kode: e['kode']!,
                            title: e['title']!,
                            date: e['date']!,
                            startTime: e['startTime']!,
                            endTime: e['endTime']!,
                            location: e['location']!
                          );
                        }).toList()
                      )
                    ),
                  )
                ],
              ),
              const Icon(Icons.directions_transit),
              // Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketCategories extends StatefulWidget {
  const TicketCategories({Key? key}) : super(key: key);
  @override
  State<TicketCategories> createState() => _TicketCategories();
}

class _TicketCategories extends State<TicketCategories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ActiveTicketProvider())
          ],
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: activeTicketCategories.length,
            itemBuilder: (BuildContext context, int idx) {
              return CustomChip(
                label: activeTicketCategories[idx],
              );
            },
          ),
        ));
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  const CustomChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('build Custom Chip');
    ActiveTicketProvider provider = Provider.of<ActiveTicketProvider>(context);
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: ChoiceChip(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
        selected: provider.getSelectedCategory == label,
        backgroundColor: Colors.transparent,
        selectedColor: Colors.transparent,
        onSelected: (bool? val) {
          if (provider.getSelectedCategory != label)
            provider.setCategory = label;
        },
        // backgroundColor: Colors.transparent,
        label: Text(
          label,
          style: TextStyle(
              color: provider.getSelectedCategory == label
                  ? Colors.blue
                  : Colors.black),
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: provider.getSelectedCategory == label
                    ? Colors.blue
                    : kGreyColor),
            borderRadius: const BorderRadius.all(Radius.circular(6.0))),
      ),
    );
  }
}
