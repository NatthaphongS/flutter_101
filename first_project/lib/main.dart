import 'package:flutter/material.dart';

import 'package:first_project/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // Scaffold is a structure(โครงสร้าง)
        // backgroundColor: Color.fromARGB(255, 183, 152, 236),
        // use Color()/Colors to create color thin g
        body: GradiantContainer(
          Color.fromARGB(255, 37, 1, 58),
          Color.fromARGB(255, 62, 4, 88),
        ),
      ),
    ),
  );
}
