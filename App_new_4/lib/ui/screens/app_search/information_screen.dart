import 'package:app_new_2/ui/screens/widgets/data_dummy.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/colors.dart';
import '../widgets/fontstyle.dart';

class InformationScreen extends StatefulWidget {
  InformationScreen({Key? key, required this.strPhone, required this.strGroup , required this.strDate }) : super(key: key);
  final String strPhone;
  final String strGroup;
  final String strDate;

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {

  @override
  void initState() {
    print('DATA:${widget.strPhone}');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration:  BoxDecoration(
        gradient: LinearGradient(
            colors: [Colos.BLUB, Colos.BACK_GROUND],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarV2(context, strTitle: widget.strPhone),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone number:', style: FontStyles.STYLE2,),
                  Text(widget.strPhone,style: TextStyle(color: Colos.BOTTOMNAVIGATOR_COLOR,fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Owner:', style: FontStyles.STYLE2,),
                  Text(widget.strGroup,style: TextStyle(color: Colos.BOTTOMNAVIGATOR_COLOR,fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Update date:', style: FontStyles.STYLE2,),
                  Text(widget.strDate,style: FontStyles.STYLE2)
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Update date:', style: FontStyles.STYLE2,),
                  Transform.scale(
                    scale: 1.2,
                      child: Icon(Icons.check_circle_outline_outlined,color: Colors.blueAccent,))
                ],
              ),
              SizedBox(height: 15),
              Text('count report',style: FontStyles.STYLE1,)
            ],
          ),
        ),
      ),
    );
  }
}

