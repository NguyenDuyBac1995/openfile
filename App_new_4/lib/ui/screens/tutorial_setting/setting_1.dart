import 'package:app_new_2/ui/screens/widgets/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/colors.dart';

class TutorialSetting extends StatefulWidget {
  const TutorialSetting({Key? key}) : super(key: key);

  @override
  State<TutorialSetting> createState() => _TutorialSettingState();
}

class _TutorialSettingState extends State<TutorialSetting> {
  resetNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('key', 1);
  }
 @override
 void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    resetNewLaunch();
  }

  PageController _pageController = PageController();
  int Index = 0;

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
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView(
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  Index = index;
                });
              },
              controller: _pageController,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Setting screen => Phone',
                        style: FontStyles.STYLE1
                      ),
                      SizedBox(height: 15),
                      const Text(
                        '  After done setting , click ',
                        style: FontStyles.STYLE2,
                      ),
                      const Text(
                        '\'Setting screen\' and choose \' Phone\'',
                        style: FontStyles.STYLE2),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Image.asset('assets/images/intro1.png'),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Image.asset('assets/images/intro2.png'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Call blocking& Identification',
                        style: FontStyles.STYLE1.copyWith(fontSize: 23),
                      ),
                      SizedBox(height: 13),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'When you select \'Phone\' , Scroll down => select',
                          style: FontStyles.STYLE2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        '\'Call blocking & Identification\'',
                        style: FontStyles.STYLE2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: TextButton(
                          child: Text('Ignore', style: FontStyles.STYLE1 ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/rules');
                          },
                        ),
                      ),
                      SizedBox(height: 64),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset('assets/images/intro3.png'),
                            ),
                            SizedBox(height: 20),
                            const Text(
                              'Turn on application',
                              style: FontStyles.STYLE1
                            ),
                            SizedBox(height: 15),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Please enable the status of the \'IBlock\' app and re-entr the app , click \'Skip\' on the right side of the screen',
                                style: FontStyles.STYLE2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              left: 185,
              child: Container(
                  height: 6,
                  width: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return buildIndicator(index == Index);
                      })),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
    );
  }
}

