
import 'package:app_new_2/ui/screens/widgets/components/app_bar.dart';
import 'package:app_new_2/ui/screens/widgets/utils/setting_style.dart';
import 'package:flutter/material.dart';

import '../../routers/router_generator.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarV1(context, strTitle: 'Setting'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SettingV1(
                  context, Icon(Icons.settings, color: Colors.white), 'Setting',
                  routername: RouterGenerator.routeChangeSetting),
              SettingV1(context,
                  Icon(Icons.help_center_outlined, color: Colors.white,),
                  'Installation Instructions',
                  routername: RouterGenerator.routeInstallation),
              SettingV1(context,
                  Icon(Icons.add_circle_outline_outlined, color: Colors.white,),
                  'Block new number',
                  routername: RouterGenerator.routeBlockNumber),
              SettingV1(
                  context, Icon(Icons.language_outlined, color: Colors.white,),
                  'Language', routername: RouterGenerator.routeLanguage),
              SettingV2(
                context, Icon(Icons.share_outlined, color: Colors.white,),
                'Share',),
              SettingV1(
                  context, Icon(Icons.security_outlined, color: Colors.white,),
                  'Privacy & Policy', routername: RouterGenerator.routePrivacy),
              SettingV2(
                context, Icon(Icons.help_center_outlined, color: Colors.white),
                'Help & Support',),
              SettingV2(
                context, Icon(Icons.info_outline_rounded, color: Colors.white,),
                'About',),
            ],
          ),
        )
    );
  }
}