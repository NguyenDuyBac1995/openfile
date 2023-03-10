import 'package:app_new_2/blocs/phone_blocs.dart';
import 'package:app_new_2/models/phone/phone_search_model.dart';
import 'package:app_new_2/ui/screens/app_search/information_screen.dart';
import 'package:app_new_2/ui/screens/widgets/components/common.dart';
import 'package:app_new_2/ui/screens/widgets/utils/colors.dart';
import 'package:app_new_2/ui/screens/widgets/components/app_bar.dart';
import 'package:app_new_2/ui/screens/widgets/utils/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../main.dart';
import '../../routers/fluro_navigator.dart';
import '../../routers/router_generator.dart';
import '../widgets/utils/data_dummy.dart';

class AppSearchScreen extends StatefulWidget {
  const AppSearchScreen({Key? key}) : super(key: key);

  @override
  State<AppSearchScreen> createState() => _AppSearchScreenState();
}

class _AppSearchScreenState extends State<AppSearchScreen> {
  var data;
  final toast = FToast();
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.red;
  }

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }
  @override
  void dispose(){
    super.dispose();
    phoneBlocs.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarV1(context, strTitle: 'Contacts'),
      body: StreamBuilder(
        stream: phoneBlocs.phoneInfoModel,
        builder: (context, AsyncSnapshot<PhoneSearchModel> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      Common().search(
                          hintText: 'Search',
                          callback: () {
                            NavigatorUtils.push(context,
                                RouterGenerator.routeSearch);
                          }
                      ),
                      SizedBox(height: 20),
                      Expanded(child: _updateData(snapshot.data!))
                    ],
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _updateData(PhoneSearchModel phoneSearchModel) {
    return Container(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
          itemCount:phoneSearchModel.data?.length ?? 0,
          itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(phoneSearchModel.data?[index].phoneNumber ?? '',
                        style: FontStyles.STYLE2
                            .copyWith(color: Colors.blueAccent),
                      ),
                      SizedBox(height: 6),
                      Text(phoneSearchModel.data?[index].backerBy ??  ''),
                    ],
                  ),
                  InkWell(
                    child: Container(
                      child: Transform.scale(
                          scale: 1.3,
                          child: Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.red,
                          )),
                    ),
                    onTap: _showBottomSheet,
                  )
                ],
              ),
            ),
            onTap: () {
              data = BundleData(
                  strPhone: phoneSearchModel.data?[index].phoneNumber,
                  StrGroup: phoneSearchModel.data?[index].backerBy,
                  StrDate: phoneSearchModel.data?[index].updatedAt);
              Navigator.pushNamed(
                  context, RouterGenerator.routeInformation,
                  arguments: data);
            },

          );
          },
          separatorBuilder: (BuildContext context, index) {
            return Divider(
              color: Colors.white,
              height: 1,
            );
          }
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
                    'Emergency Blocking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    showBottomToast();
                  },
                ),
              ),
              const Divider(
                height: 0.2,
                color: Colors.grey,
              ),
              ListTile(
                title: TextButton(
                    child: const Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _showDialog();
                    }
                ),
              ),
              const Divider(
                height: 0.2,
                color: Colors.grey,
              ),
              ListTile(
                title: TextButton(
                  child: const Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10),
                      const Text(
                        'B??o C??o',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  checkColor: Colors.white,
                                  value: value1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      value1 = value!;
                                    });
                                  }),
                            ),
                            Text('L???a ?????o',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(
                                        !value1 ? 0xFF000000 : 0xFFE53935))),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  checkColor: Colors.white,
                                  value: value2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      value2 = value!;
                                    });
                                  }),
                            ),
                            Text('L??m phi???n',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(
                                        !value2 ? 0xFF000000 : 0xFFE53935))),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  checkColor: Colors.white,
                                  value: value3,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      value3 = value!;
                                    });
                                  }),
                            ),
                            Text('M??i gi???i',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(
                                        !value3 ? 0xFF000000 : 0xFFE53935))),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  checkColor: Colors.white,
                                  value: value4,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      value4 = value!;
                                    });
                                  }),
                            ),
                            Text('????i n???',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(
                                        !value4 ? 0xFF000000 : 0xFFE53935))),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  checkColor: Colors.white,
                                  value: value5,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      value5 = value!;
                                    });
                                  }),
                            ),
                            Text('kh??c',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(
                                        !value5 ? 0xFF000000 : 0xFFE53935))),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            width: 100,
                            child: TextButton(
                              child: Text(
                                'Report',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            width: 100,
                            child: TextButton(
                              child: Text(
                                'Canel',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showBottomToast() =>
      toast.showToast(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Block Success',
              style: FontStyles.STYLE2.copyWith(color: Colos.BLUB_BUTTON),
            ),
          ),
          gravity: ToastGravity.BOTTOM,
          toastDuration: Duration(seconds: 4),
          positionedToastBuilder: (context, child) =>
              Positioned(bottom: 20, left: 0, right: 0, child: child));
}
