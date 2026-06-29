import 'package:amk_mobile/views/home/amk_home_view.dart';
import 'package:amk_mobile/views/home/card_view.dart';
import 'package:amk_mobile/views/home/chat_view.dart';
import 'package:amk_mobile/views/home/other_view.dart';
import 'package:amk_mobile/views/home/scan_qr_view.dart';
import 'package:flutter/material.dart';

import 'navigation_bottom/main_bottom_navigation_bar.dart';

class AmkMainHomeView extends StatefulWidget {
  const AmkMainHomeView({super.key});

  @override
  State<AmkMainHomeView> createState() => _AmkMainHomeViewState();
}

class _AmkMainHomeViewState extends State<AmkMainHomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AmkHomeView(),
    CardView(),
    ScanQRView(),
    ChatView(),
    OtherView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: IndexedStack(index: _selectedIndex, children: _pages),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
