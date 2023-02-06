import 'package:app_new_2/main.dart';
import 'package:app_new_2/ui/screens/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import 'fontstyle.dart';

GestureDetector SettingV1(BuildContext context, Icon icon, String text, {String? routername }){
  return GestureDetector(
    child:Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Transform.scale(
              scale: 1.2,
              child: icon),
          SizedBox(width: 25),
          Text( text ,style: FontStyles.STYLE2.copyWith(fontSize: 19))
        ],
      ),
    ),
    onTap: (){
      Navigator.pushNamed(context, routername!);
    },
  );
}

GestureDetector SettingV2(BuildContext context, Icon icon, String text,){
  return GestureDetector(
    child:Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Transform.scale(
              scale: 1.2,
              child: icon),
          SizedBox(width: 25),
          Text( text ,style: FontStyles.STYLE2.copyWith(fontSize: 19))
        ],
      ),
    ),
    onTap: _launchUrl,
  );
}
final Uri _url = Uri.parse('https://khonglamphien.com');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}