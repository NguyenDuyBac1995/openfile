import 'package:app_new_2/ui/screens/widgets/app_bar.dart';
import 'package:app_new_2/ui/screens/widgets/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/colors.dart';

class ChangeSettingScreen extends StatefulWidget {
  const ChangeSettingScreen({Key? key}) : super(key: key);

  @override
  State<ChangeSettingScreen> createState() => _ChangeSettingScreenState();
}

class _ChangeSettingScreenState extends State<ChangeSettingScreen> {
  bool _isBlockCall = true ;
  bool _isDisturbCall = true;
  var textValue;
  var textValue1;

  void togSwitch(bool value) {
    setState(() {
      _isBlockCall = value ;
      if (_isBlockCall == true) {
        setState(() {
          _isBlockCall = true;
          textValue = 'Block call is ON';
          showBottomToast(textValue);
        });
      } else {
        setState(() {
          _isBlockCall = false;
          textValue = 'Block call is OFF';
          showBottomToast(textValue);
        });
      }
    });

  }

  void togSwitch1(bool value) {
    setState(() {
      _isDisturbCall = value ;
      if (_isDisturbCall == true) {
        setState(() {
          _isDisturbCall = true;
          textValue1 = 'Disturb call is ON';
          showBottomToast(textValue1);
        });
      } else {
        setState(() {
          _isDisturbCall = false;
          textValue1 = 'Disturb call is OFF';
          showBottomToast(textValue1);
        });
      }
    });

  }
  final toast = FToast();
  @override
  void initState() {
    super.initState();
    toast.init(context);
  }
  void showBottomToast(String text) => toast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: FontStyles.STYLE2.copyWith(color: Colors.blue),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
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
        appBar: appBarV2(context, strTitle: 'Settings'),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Icon(
                      Icons.call_end
                    ),
                  ) ,
                  title: Text('Block annoying calls, spam...', style: FontStyles.STYLE2.copyWith(fontSize: 16),),
                  trailing: Switch(
                    value: _isBlockCall,
                    onChanged: togSwitch,
                    activeColor: Colors.blueAccent,
                    activeTrackColor: Colors.indigo,
                    inactiveThumbColor: Colors.blueAccent,

                  ),
                ),
              ),
              Divider(height: 0.3,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Icon(
                        Icons.circle_notifications_outlined
                    ),
                  ) ,
                  title: Text('Disturb call alert', style: FontStyles.STYLE2.copyWith(fontSize: 16),),
                  trailing: Switch(
                    value: _isDisturbCall,
                    onChanged: togSwitch1,
                    activeColor: Colors.blueAccent,
                    activeTrackColor: Colors.indigo,
                    inactiveThumbColor: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
