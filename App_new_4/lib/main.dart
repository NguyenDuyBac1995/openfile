import 'dart:ui';

import 'package:app_new_2/ui/screens/app_search/app_search_screen.dart';
import 'package:app_new_2/ui/screens/app_search/information_screen.dart';
import 'package:app_new_2/ui/screens/app_search/search_screen.dart';
import 'package:app_new_2/ui/screens/block/request_block.dart';
import 'package:app_new_2/ui/screens/home/home_page.dart';
import 'package:app_new_2/ui/screens/rules/rules.dart';
import 'package:app_new_2/ui/screens/setting/block_number.dart';
import 'package:app_new_2/ui/screens/setting/change_setting_screen.dart';
import 'package:app_new_2/ui/screens/setting/installation_screen.dart';
import 'package:app_new_2/ui/screens/setting/language_screen.dart';
import 'package:app_new_2/ui/screens/setting/privacy_policy_screen.dart';
import 'package:app_new_2/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'ui/screens/tutorial_setting/setting_1.dart';

class BundleData {
  String? strPhone;
  String? StrName;
  String? StrGroup;
  String? StrDate;

  BundleData({
    this.strPhone,
    this.StrName,
    this.StrDate,
    this.StrGroup,
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class RouterGenerator {
  static const routeSplash = "/splash";
  static const routeTutorial = "/tutorial";
  static const routeInformation = '/information';
  static const routeRules = '/rules';
  static const routeHome = '/home';
  static const routeSearch = '/search';
  static const routeRequestBlock = '/requestblock';
  static const routeChangeSetting = '/changesetting';
  static const routeBlockNumber = '/blocknumbe';
  static const routeInstallation = '/installation';
  static const routeLanguage = '/language';
  static const routePrivacy = '/privacy';

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case routeInformation:
        if (args is BundleData) {
          return MaterialPageRoute(
              builder: (_) => InformationScreen(
                    strPhone: args.strPhone!,
                    strGroup: args.StrGroup!,
                    strDate: args.StrDate!,
                  ));
        }
        break;
      case routeSplash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case routeTutorial:
        return MaterialPageRoute(builder: (_) => TutorialSetting());
      case routeRules:
        return MaterialPageRoute(builder: (_) => RulesScreen());
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomePage());
      case routeSearch:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case routeRequestBlock:
        return MaterialPageRoute(builder: (_) => RequestBlockScreen());
      case routeChangeSetting:
        return MaterialPageRoute(builder: (_) => ChangeSettingScreen());
      case routeBlockNumber:
        return MaterialPageRoute(builder: (_) => BlockNumberScreen());
      case routeInstallation:
        return MaterialPageRoute(builder: (_) => InstallationScreen());
      case routeLanguage:
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      case routePrivacy:
        return MaterialPageRoute(builder: (_) => PrivacyScreen());
      default:
        break;
    }
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouterGenerator.routeSplash,
        onGenerateRoute: RouterGenerator.generateRoute);
  }
}
