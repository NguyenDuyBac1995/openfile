import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/app_bar.dart';
import '../widgets/colors.dart';
import '../widgets/fontstyle.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> value = ['English', 'VietNam', 'Japan'];
  int indexSelected = 0;
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
          'Changes language success',
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
          appBar: appBarV2(context, strTitle: 'Language'),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 13),
                          decoration: BoxDecoration(
                              color: indexSelected == index
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Text(
                            value[index],
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            indexSelected = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colos.BOTTOMNAVIGATOR_COLOR,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Confirm',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                  ),
                  onTap: (){
                    showBottomToast();
                  },
                ),
              ),
            ],
          )),
    );
  }
}
