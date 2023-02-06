import 'package:app_new_2/ui/screens/widgets/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../app_search/app_search_screen.dart';
import '../block/black_list_screen.dart';
import '../contact/contact_screen.dart';
import '../setting/settings_screen.dart';
import '../widgets/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   var _currentIndex = 0;
   static const List<Widget> _page = <Widget>[
     AppSearchScreen(),
     BlockListScreen(),
     Contact(),
     SettingScreen(),
   ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colos.BLUB, Colos.BACK_GROUND],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        body: Center(
          child: _page.elementAt(_currentIndex),
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colos.BOTTOMNAVIGATOR_COLOR,
                borderRadius : BorderRadius.only(
              topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
          )
          ) ,
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            margin: EdgeInsets.symmetric(vertical: 10),
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home",style: FontStyles.STYLE2,),
                selectedColor: Colos.BLUB,
              ),
              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.app_blocking),
                title: Text("Black list", style: FontStyles.STYLE2),
                selectedColor: Colos.BLUB,
              ),
              /// Search
              SalomonBottomBarItem(
                icon: Icon(Icons.contact_phone_outlined),
                title: Text("Contact", style: FontStyles.STYLE2),
                selectedColor: Colos.BLUB,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.settings),
                title: Text("Settings", style: FontStyles.STYLE2),
                selectedColor: Colos.BLUB,
              ),
            ],
          ),
        ),
      ),
    );
  }
}





