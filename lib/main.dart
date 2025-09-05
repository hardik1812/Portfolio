import 'package:flutter/material.dart';

import 'package:portfolio/main/landing.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Portfolio' ,
      debugShowCheckedModeBanner: false,
      home: HoverButton()
    );
  }
}
