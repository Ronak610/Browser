import 'package:browser/Browser/View/Home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../View/Browser_Page.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  List l1 = [
    Browser_Page(),
    Home_Page(),
  ];
  int i=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:l1[i],bottomNavigationBar: BottomNavigationBar(
        onTap:(index){
          setState(() {
            i=index;
          });
        },
        currentIndex: i,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          ],
        ),
      ),
    );
  }
}
