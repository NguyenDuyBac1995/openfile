import 'package:app_new_2/ui/screens/widgets/components/app_bar.dart';
import 'package:app_new_2/ui/screens/widgets/utils/colors.dart';
import 'package:app_new_2/ui/screens/widgets/utils/data_dummy.dart';
import 'package:app_new_2/ui/screens/widgets/utils/fontstyle.dart';
import 'package:app_new_2/ui/screens/widgets/components/text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlockListScreen extends StatefulWidget {
  const BlockListScreen({Key? key}) : super(key: key);

  @override
  State<BlockListScreen> createState() => _BlockListScreenState();
}

class _BlockListScreenState extends State<BlockListScreen> {
  final toast = FToast();
  String? numberPhone ;

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }


  void ShowToast() => toast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 3),
        positionedToastBuilder: (context, child) => Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: child,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red[400],
          ),
          child: Text(
            'Please enter the number to block',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );

  void getToast() => toast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 3),
        positionedToastBuilder: (context, child) => Positioned(
          bottom: 25,
          right: 0,
          left: 0,
          child: child,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Text(
            '+84$numberPhone Allow call',
            style: TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarV3(context, strTitle: 'Black List'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFieldFontV1(context, hinText: 'Phone number to block'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 430,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: dummyData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.3, color: Colors.white)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '+84${dummyData[index].phone}',
                                      style: FontStyles.STYLE2
                                          .copyWith(fontSize: 18),
                                    ),
                                    SizedBox(height: 2),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Block date: ',
                                          style: TextStyle(
                                              color: Colors.blue[400],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        TextSpan(
                                          text: dummyData[index].date,
                                          style: FontStyles.STYLE2
                                              .copyWith(fontSize: 16),
                                        )
                                      ]),
                                    ),
                                  ],
                                ),
                                Transform.scale(
                                  scale: 1,
                                  child: SvgPicture.asset('assets/svg/checked.svg')
                                   ,
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          numberPhone= dummyData[index].phone ;
                          print('$numberPhone');
                          _showBottomSheet();
                        },
                      );
                    }),
              ),
              SizedBox(height: 2),
              Text(
                'App enable:\'Settings\'-> \'Phone\'->\'Call blocking & Identification\' -> Enable\'Iblock\'',
                textAlign: TextAlign.center,
                style: FontStyles.STYLE2.copyWith(fontSize: 12),
              ),
              SizedBox(height: 14),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colos.BOTTOMNAVIGATOR_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    child: Text(
                      'Emergency blocking',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black),
                    ),
                    onPressed: ShowToast,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Wrap(
            children: [
              ListTile(
                title: TextButton(
                  child: const Text(
                    'Allow call',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    getToast();
                  },
                ),
              ),
              const Divider(
                height: 0.2,
                color: Colors.grey,
                endIndent: 10,
                indent: 10,
              ),
              ListTile(
                title: TextButton(
                  child: const Text(
                    'Request remove phone from black list',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    _showDialog();
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(

              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Request Removal From the',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'blacklist: +84$numberPhone',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  TextFieldFontV1(context, hinText: 'Enter your name'),
                  SizedBox(height: 8),
                  TextFieldFontV1(context, hinText: 'Enter your phone number'),
                  SizedBox(height: 8),
                  TextFieldFontV3(context, hinText: 'Enter reason'),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 39,right: 39),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       GestureDetector(
                          child: Container(
                            child: Text(
                              'Cancel',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                         onTap: (){
                            Navigator.pop(context);
                         },
                        ),
                        GestureDetector(
                          child: Container(
                            child: Text(
                              'Send',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
