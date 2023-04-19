import 'package:flutter/material.dart';

import 'package:flutter_shader_sample/widgets/screens/cellular_screen.dart';
import 'package:flutter_shader_sample/widgets/screens/delaunay_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/delaunay",
      routes: {
        "/cellular": (context) => const CellularScreen(),
        "/delaunay": (context) => const DelaunayScreen(),
      },
    );
  }
}