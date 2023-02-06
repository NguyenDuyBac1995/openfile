import 'package:url_launcher/url_launcher.dart';

class Common{

  Future<void> goUrl(String strUrl) async {
    launchUrl(Uri.parse(strUrl));
  }
}