import 'package:flutter/material.dart';

class MenuItem {
  final int order;
  final IconData icon;
  final String title;

  MenuItem({required this.order, required this.icon, required this.title});
}

final List<MenuItem> menuItems = [
  MenuItem(order: 1, icon: Icons.account_balance, title: 'Accounts'),
  MenuItem(order: 2, icon: Icons.payment, title: 'Payments'),
  MenuItem(order: 3, icon: Icons.switch_account, title: 'Local Transfer'),
  MenuItem(order: 4, icon: Icons.history, title: 'History'),
  MenuItem(order: 5, icon: Icons.phone, title: 'Phnone Top up'),
  MenuItem(order: 6, icon: Icons.map, title: 'Oversease Transfer'),
];
