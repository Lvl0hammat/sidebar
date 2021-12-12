import 'package:flutter/material.dart';

class DrawerItems {
  IconData icon;
  String text;

  DrawerItems({required this.text, required this.icon});
}

List<DrawerItems> items = [
  DrawerItems(text: "Dashboard", icon: Icons.insert_chart),
  DrawerItems(text: "Application", icon: Icons.group_outlined),
  DrawerItems(text: "FAQs", icon: Icons.textsms_outlined),
];
