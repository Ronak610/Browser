import 'package:browser/Browser/Provider/Browser_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Browser_Provider? providertrue;
  Browser_Provider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<Browser_Provider>(context, listen: true);
    providerfalse = Provider.of<Browser_Provider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,title: Text("Wikipedia",style: TextStyle(color: Colors.black),),),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: providertrue!.modal.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  providerfalse!.ChangeIndex(index);
                      Navigator.pushNamed(context, 'S');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network("${providertrue!.modal[index].image}"),
                  color: Colors.white,
                ),
              ),
            ),
            Text("${providertrue!.modal[index].name}"),
          ],
        ),
      ),
    ));
  }
}
