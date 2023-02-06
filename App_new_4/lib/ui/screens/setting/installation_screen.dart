import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/colors.dart';
import '../widgets/fontstyle.dart';

class InstallationScreen extends StatefulWidget {
  const InstallationScreen({Key? key}) : super(key: key);

  @override
  State<InstallationScreen> createState() => _InstallationScreenState();
}

class _InstallationScreenState extends State<InstallationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colos.BLUB, Colos.BACK_GROUND],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarV2(context, strTitle: 'Installation Instructions'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Setting screen => Phone',
                      style: FontStyles.STYLE1,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'After done setting , click ',
                      style: FontStyles.STYLE2,
                    ),
                    Text(' \'Setting screen\' and choose \' Phone\'',
                        style: FontStyles.STYLE2),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset('assets/images/intro1.png'),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Call blocking& Identification',
                      style: FontStyles.STYLE1.copyWith(fontSize: 23),
                    ),
                    SizedBox(height: 13),
                    Text(
                      'When you select \'Phone\' , Scroll down => select',
                      style: FontStyles.STYLE2,
                      textAlign: TextAlign.start,
                    ),
                    const Text(
                      ' \'Call blocking & Identification\'',
                      style: FontStyles.STYLE2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset('assets/images/intro2.png'),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        const Text('Turn on application',
                            style: FontStyles.STYLE1),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(
                            'Please enable the status of the \'IBlock\' app and re-entr the app , click \'Skip\' on the right side of the screen',
                            style: FontStyles.STYLE2,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset('assets/images/intro3.png'),
                        ),

                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
