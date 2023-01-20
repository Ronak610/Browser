import 'package:browser/Browser/Provider/Browser_provider.dart';
import 'package:browser/until/Share_Pref.dart';
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
  List<String> urls = [];
  bool b1=true;

  @override
  void initState() {
    super.initState();
  }

  void getBookmark() async {
    urls = (await readbookmark())!;
  }

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
                height: 56,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue, width: 2)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          providerfalse!.inAppWebViewController!.goBack();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      IconButton(
                        onPressed: () {
                          providerfalse!.inAppWebViewController!.goForward();
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                      IconButton(
                        onPressed: () {
                          providerfalse!.inAppWebViewController!.reload();
                        },
                        icon: Icon(Icons.refresh),
                      ),
                      Expanded(
                        child: TextField(
                          controller: txtsearch,
                          decoration: InputDecoration(
                            hintText: "search",
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
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                       setState(() {
                         b1= !b1;
                       });
                          Uri? uri = await providerfalse!
                              .inAppWebViewController!
                              .getOriginalUrl();
                          urls.add("$uri");
                          addbookmark(urls);
                        },
                        icon: b1?Icon(
                          Icons.bookmark_outline_sharp
                        ):Icon(Icons.bookmark),color: Colors.black,
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return urls
                              .map((e) => PopupMenuItem(
                                    child: Text("$e"),
                                    onTap: () {
                                      providerfalse!.inAppWebViewController!
                                          .loadUrl(
                                              urlRequest: URLRequest(
                                                  url: Uri.parse(e)));
                                    },
                                  ))
                              .toList();
                        },
                      )
                    ],
                  ),
                ),
              ),
              providertrue!.progerss == 1.0
                  ? Container()
                  : Container(
                      height: 3,
                      width: 325,
                      child: LinearProgressIndicator(
                        value: providertrue!.progerss,
                      ),
                    ),
              SizedBox(height: 5,),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse("https://www.google.com/"),
                  ),
                  onWebViewCreated: (controller) {
                    providerfalse!.inAppWebViewController = controller;
                  },
                  onProgressChanged: (controller, progress) {
                    providerfalse!.ChangeProgress(progress / 100);
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
