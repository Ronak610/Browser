import 'package:browser/Browser/Bottom_Navigation_Bar/bottton_page.dart';
import 'package:browser/Browser/Provider/Browser_provider.dart';
import 'package:browser/Browser/View/Browser_Page.dart';
import 'package:browser/Browser/View/Show_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Browser_Provider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Bottom(),
          'B': (context) => Browser_Page(),
          'S': (context) => show_Page(),
        },
      ),
    ),
  );
}
