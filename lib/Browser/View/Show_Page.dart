import 'package:browser/Browser/Provider/Browser_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class show_Page extends StatefulWidget {
  const show_Page({Key? key}) : super(key: key);

  @override
  State<show_Page> createState() => _show_PageState();
}

class _show_PageState extends State<show_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "${Provider.of<Browser_Provider>(context, listen: true).modal[Provider.of<Browser_Provider>(context, listen: true).index! - 9].uri}")),
        ),
      ),
    );
  }
}
