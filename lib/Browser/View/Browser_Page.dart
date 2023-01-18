import 'package:browser/Browser/Provider/Browser_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class Browser_Page extends StatefulWidget {
  const Browser_Page({Key? key}) : super(key: key);

  @override
  State<Browser_Page> createState() => _Browser_PageState();
}

class _Browser_PageState extends State<Browser_Page> {
  Browser_Provider? providertrue;
  Browser_Provider? providerfalse;
  TextEditingController txtsearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<Browser_Provider>(context, listen: true);
    providerfalse = Provider.of<Browser_Provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: txtsearch,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            providerfalse!.ChangeSearch(txtsearch.text);
                            providerfalse!.inAppWebViewController!.loadUrl(
                              urlRequest: URLRequest(
                                url: Uri.parse(
                                    "https://www.google.com/search?q=${txtsearch.text}"),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse("https://www.google.com/"),
                  ),
                  onWebViewCreated: (controller) {
                    providerfalse!.inAppWebViewController = controller;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
