import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../routers/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // bool isLoggedIn = false;
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   login().then((value) {
  //     if(isLoggedIn){
  //       Navigator.pushReplacementNamed(context, "/main");
  //     }else{
  //       Navigator.pushReplacementNamed(context, "/login");
  //     }
  //   });
  //
  //   login() async {
  //     int _jobsRemained = 2;
  //     while (_jobsRemained > 0) {
  //       if (!isLoggedIn){
  //         SharedPreferences prefs = await SharedPreferences.getInstance();
  //         isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //         _jobsRemained--;
  //       }
  //       Future.delayed(Duration(seconds: 3)).then((value) => {_jobsRemained--});
  //     }
  //
  //   }
  // }
  // int _counter = 3;
  // late Timer _timer;
  int isFistSetup = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () { _getStatus();});
  }

  _getStatus()async{
    print('$isFistSetup');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      int? isFistSetup = prefs.getInt('key')??0;
      print('$isFistSetup');
      if(isFistSetup == 0){
        Navigator.pushNamed(context, RouterGenerator.routeTutorial);
      }else{
        Navigator.pushNamed(context, RouterGenerator.routeRules);
      }
    });
  }
  // void _startTimer() {
  //   _counter = 3;
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
  //     if (_counter > 0) {
  //       setState(() {
  //         _counter--;
  //       });
  //     } else {
  //       _timer.cancel();
  //       if (Platform.isIOS) {
  //         if (isFistSetup) {
  //           Navigator.pushNamed(context, RouterGenerator.routeTutorial);
  //         } else {
  //           Navigator.pushNamed(context, RouterGenerator.routeTutorial);
  //         }
  //       }else{
  //         Navigator.pushNamed(context, RouterGenerator.routeTutorial);
  //       }
  //       if (isFistSetup) {
  //         Navigator.pushNamed(context, RouterGenerator.routeTutorial);
  //       } else {
  //         if (Platform.isIOS) {
  //           Navigator.pushNamed(context, RouterGenerator.routeRules);
  //         } else {
  //           Navigator.pushNamed(context, RouterGenerator.routeTutorial);
  //
  //         }
  //       }
  //     }
  //   });
  // }

  // bool backScreen = false;
  // void _backScreen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // await prefs.clear();
  //   // Navigator.pushNamed(context, RouterGenerator.routeTutorial);
  //   // print('$backScreen');
  //   backScreen = prefs.getBool('value') ?? true;
  //   if (backScreen) {
  //     Navigator.pushNamed(context, RouterGenerator.routeTutorial);
  //   } else {
  //     Navigator.pushNamed(context, RouterGenerator.routeRules);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Color(0xFF101F2D),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Image.asset(
            'assets/logo/logo_splash.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
