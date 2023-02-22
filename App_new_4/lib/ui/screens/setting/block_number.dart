import 'package:flutter/material.dart';

import '../widgets/components/app_bar.dart';
import '../widgets/utils/colors.dart';
import '../widgets/utils/fontstyle.dart';
import '../widgets/components/text_from_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BlockNumberScreen extends StatefulWidget {
  const BlockNumberScreen({Key? key}) : super(key: key);

  @override
  State<BlockNumberScreen> createState() => _BlockNumberScreenState();
}

class _BlockNumberScreenState extends State<BlockNumberScreen> {
  final TextEditingController text1 = TextEditingController();
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  void showBottomToast() => toast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          '${text1.text} blocking success',
          style: FontStyles.STYLE2.copyWith(color: Colors.blue),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) =>
          Positioned(bottom: 25, left: 0, right: 0, child: child));

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
        appBar: appBarV2(context, strTitle: 'Block new number'),
        body:
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: TextFieldFontV1(
                  context,
                  hinText: 'Phone number to block',
                  text: text1,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colos.BOTTOMNAVIGATOR_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextButton(
                      child: Text(
                        'Emergency blocking',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        showBottomToast();
                      }),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
