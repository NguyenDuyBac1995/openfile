import 'package:app_new_2/ui/screens/widgets/app_bar.dart';
import 'package:app_new_2/ui/screens/widgets/colors_text.dart';
import 'package:app_new_2/ui/screens/widgets/data_dummy.dart';
import 'package:app_new_2/ui/screens/widgets/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
 final toast = FToast();

 @override
 void initState() {
    super.initState();
    toast.init(context);
    dummyData.sort((a,b)=> a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarV1(context, strTitle: 'Constact'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 10, top: 15, right: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: dummyData.length,
          itemBuilder: (BuildContext context, int index) {
            String strName = dummyData[index].name;
            return GestureDetector(
              onTap: _showBottomSheet,
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 0.3, color: Colors.white)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Text(
                              '${_getInitials(strName)[0]}${_getInitials(strName)[1]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            radius: 21.5,
                              backgroundColor: _colorBackgroundConfig(strName)
                          ),
                          SizedBox(width: 13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dummyData[index].name,
                                  style:
                                      FontStyles.STYLE2.copyWith(fontSize: 16)),
                              SizedBox(height: 1),
                              Text(dummyData[index].phone.toString(),
                                  style: FontStyles.STYLE2.copyWith(fontSize: 16))
                            ],
                          )
                        ],
                      ),
                      Icon(Icons.more_horiz_outlined,color: Colors.blueAccent,)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  void _showBottomSheet(){
   showModalBottomSheet(
       context: context, builder: (context){
         return Padding(
           padding: EdgeInsets.symmetric(vertical: 8),
           child: TextButton(
             child:  Text(
               'Emergency blocking',
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 15.0,
                 color: Colors.red,
                 fontWeight: FontWeight.w700,
               ),
             ),
             onPressed: (){
               Navigator.pop(context);
               showBottomToast();
             },
           ),
         );
   });
  }



  void showBottomToast() => toast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          'Block Success',
          style: FontStyles.STYLE2.copyWith(color: Color(0xff45d0e2)),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
      positionedToastBuilder: (context, child) =>
          Positioned(bottom: 25, left: 0, right: 0, child: child));


  String _getInitials(String user) {
    var buffer = StringBuffer();
    var split = user.split(" ");
    for (var s in split) buffer.write(s[0]);
    var string = buffer.toString().substring(0, split.length);
    return string;
  }

 Color _colorBackgroundConfig(String user) {
    Color? backgroundColor;
   if (RegExp(r'[A-Z]|').hasMatch(
     user
   )) {
     backgroundColor =
     colorData[user[0].toLowerCase().toString()];
   }
   return backgroundColor ?? Colors.blue;
 }
}
