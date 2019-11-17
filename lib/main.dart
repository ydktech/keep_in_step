import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:keep_in_step/LoginPage.dart';
void main() {
  initializeDateFormatting().then((_) => runApp(Main()));
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}