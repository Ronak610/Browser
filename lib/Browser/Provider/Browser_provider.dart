import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../Modal/Browser_Modal.dart';

class Browser_Provider extends ChangeNotifier {
  String SearchData = "https://www.google.com/";
  InAppWebViewController? inAppWebViewController;
  int? index;
  void ChangeSearch(String data) {
    SearchData = data;
    notifyListeners();
  }
  void ChangeIndex(ind) {
    index = ind;
    notifyListeners();
  }


  List<Browser_Modal> modal = [
    Browser_Modal(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/YouTube_social_red_square_%282017%29.svg/1024px-YouTube_social_red_square_%282017%29.svg.png",
        name: "Youtube",
        uri: "https://www.youtube.com/"),
    Browser_Modal(
        image:
            "https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/flipkart-icon.png",
        name: "flipkart",
        uri: "https://www.flipkart.com/"),
    Browser_Modal(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png",
        name: "Amazon",
        uri:
            "https://www.amazon.in/?&ext_vrnc=hi&tag=googhydrabk1-21&ref=pd_sl_5szpgfto9i_e&adgrpid=58075519359&hvpone=&hvptwo=&hvadid=486462756371&hvpos=&hvnetw=g&hvrand=8725968498181400949&hvqmt=e&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9062189&hvtargid=kwd-64107830&hydadcr=14452_2154371&gclid=EAIaIQobChMI9PL0j8XQ_AIVBw4rCh1f2QZiEAAYASAAEgKzQPD_BwE"),
    Browser_Modal(
        image:
            "https://e1.pngegg.com/pngimages/260/212/png-clipart-macos-app-icons-shopify-thumbnail.png",
        name: "shopify",
        uri: "https://www.shopify.com/in"),
    Browser_Modal(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/2048px-Google_Chrome_icon_%28February_2022%29.svg.png",
        name: "Chrome",
        uri: "https://www.google.com/"),
    Browser_Modal(
        image:
            "https://helios-i.mashable.com/imagery/articles/04EZglaVzAW19V6FIiDD3TA/images-1.fit_lim.size_376x.png",
        name: "playstore",
        uri: "https://play.google.com/store/games"),
    Browser_Modal(
        image:
            "https://e7.pngegg.com/pngimages/804/985/png-clipart-social-media-logo-computer-icons-information-twitter-logo-media.png",
        name: "twitter",
        uri: "https://twitter.com/"),
    Browser_Modal(
        image: "https://cdn-icons-png.flaticon.com/512/124/124038.png",
        name: "skype",
        uri: "https://www.skype.com/en/"),
    Browser_Modal(
        image:
            "https://w7.pngwing.com/pngs/138/165/png-transparent-yahoo-news-mobile-app-android-yahoo-mail-free-icon-yahoo-miscellaneous-purple-text-thumbnail.png",
        name: "yahoo",
        uri:
            "https://in.search.yahoo.com/?guccounter=1&guce_referrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8&guce_referrer_sig=AQAAAE10Er2ZH6lSzW9ZHXTMIbwzXuZjq0jJ71M9v-rjk4C9PSglJHYUeO2ykShjNmaVH0A5lsdBG-5DfzeylFPugYhW8vjRJFyZaCxuak-x1ilIJch4HsAiGgoZikKfqj4fERPCIwzjpKirdQVL_z_Rt11EI9wLLlNIi9j3NIUUbZzF"),
    Browser_Modal(
        image:"https://image.winudf.com/v2/user/admin/YWRtaW5fMTMwMTU5ODk0NjYxNF8ucGljX2hkLmpwZ18xNTk4OTQ2NzczMzIx/icon.png?w=184&fakeurl=1",
        name: "vidmate",
        uri:"https://www.9apps.com/android-apps/HD-Video-Downloader-and-Live-TV-VidMate/"),
    Browser_Modal(
      image: "https://static.vecteezy.com/system/resources/previews/006/874/233/original/netflix-logo-icon-on-white-background-free-vector.jpg",
        name: "netflix",
        uri:"https://www.netflix.com/in/"),
    Browser_Modal(
        image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoWGtVnPSCgMp224BIqYI5EonKb7B01bmki0pc_ZCLBKxRwS3XOGy3RHdV9MZh0s2gXqE&usqp=CAU",
        name: "booking",
        uri:"https://www.booking.com/index.html?aid=378266;label=booking-name-IquAp*EbiLS6jPVl_he8yQS461500239787:pl:ta:p1:p22,563,000:ac:ap:neg:fi:tikwd-65526620:lp9062189:li:dec:dm:ppccp=UmFuZG9tSVYkc2RlIyh9YYriJK-Ikd_dLBPOo0BdMww;ws=&gclid=EAIaIQobChMIjM-5k9zQ_AIVmBsrCh3FcwcPEAAYASAAEgI3YfD_BwE"),
  ];
}
