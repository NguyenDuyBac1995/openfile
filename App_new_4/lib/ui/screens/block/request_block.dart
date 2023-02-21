import 'package:app_new_2/ui/screens/widgets/app_bar.dart';
import 'package:app_new_2/ui/screens/widgets/text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/colors.dart';
import '../widgets/fontstyle.dart';

class RequestBlockScreen extends StatefulWidget {
  const RequestBlockScreen({Key? key}) : super(key: key);

  @override
  State<RequestBlockScreen> createState() => _RequestBlockScreenState();
}

class _RequestBlockScreenState extends State<RequestBlockScreen> {
  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();
  final TextEditingController text3 = TextEditingController();
  final TextEditingController text4 = TextEditingController();
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colos.BLUB, Colos.BACK_GROUND],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarV2(context, strTitle: 'Request block new phone'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFieldFontV1(context,
                          hinText: 'Phone number to block',),
                      SizedBox(height: 8),
                      TextFieldFontV1(context, hinText: 'Enter your name', text: text2),
                      SizedBox(height: 8),
                      TextFieldFontV1(context,
                          hinText: 'Enter your phone number', text: text3),
                      SizedBox(height: 8),
                      TextFieldFontV3(
                        context,
                        hinText: 'Enter reason',
                        textController2: text4
                      ),
                    ],
                  )),
              SizedBox(height: 250),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colos.BOTTOMNAVIGATOR_COLOR,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextButton(
                      child: Text(
                        'Emergency blocking',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19,color: Colors.black),
                      ),
                      onPressed: (){
                      showBottomToast();
                      }
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomToast() => toast.showToast(
      child: buildToast(),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
      positionedToastBuilder: (context, child) =>
          Positioned(bottom: 20, left: 0, right: 0, child: child));

  Widget buildToast() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.red[400],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Fill in the data',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
}
