import 'package:flutter/material.dart';
import 'package:news/screens/widget/drawer.dart';

class GnarlScreen extends StatelessWidget {
  static const String routeName = '/Gnarl';
  const GnarlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gnarl"),
        centerTitle: true,
      ),
      drawer: DrawerItems(),
    );
  }
}
