import 'package:flutter/material.dart';
import 'package:side_drawer/collapsing_drawer.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: kBackgroundColor,
        title: const Text(
          "SideBar",
        ),
      ),
      drawer: const SafeArea(child: CollapsingDrawer()),
      body: Stack(
        children: <Widget>[
          Container(
            color: kBackgroundColor,
          ),
          // CollapsingDrawer(),
        ],
      ),
    );
  }
}
