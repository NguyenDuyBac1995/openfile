import 'package:app_new_2/ui/screens/widgets/app_bar.dart';
import 'package:app_new_2/ui/screens/widgets/data_dummy.dart';
import 'package:app_new_2/ui/screens/widgets/fontstyle.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../routers/navigator.dart';
import '../widgets/colors.dart';
import '../widgets/text_fom_field.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController text1 = TextEditingController();
  List<Phone> _numberPhone = [];
  @override
  void initState() {
    super.initState();
    _numberPhone = dummyData;
  }

  void _runFilter(String text) {
    List<Phone> result = [];
    if (text.isEmpty) {
      result = dummyData;
    } else {
      result = dummyData
          .where(
              (user) => user.phone.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    setState(() {
      _numberPhone = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colos.BLUB, Colos.BACK_GROUND],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarV2(context, strTitle: 'Search number'),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => _runFilter(value),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    controller: text1,
                    decoration: InputDecoration(
                      prefixIcon: Transform.scale(
                          scale: 1.4,
                          child: Icon(Icons.search, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.7, color: Colors.white),
                          borderRadius: BorderRadius.circular(6)),
                      filled: true,
                      fillColor: Colos.BOTTOMNAVIGATOR_COLOR,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      child: _numberPhone.isNotEmpty?
                          ListView.builder(
                            itemCount: _numberPhone.length,
                              itemBuilder: (context,index){
                            return ListTile(
                              onTap: (){
                               var data = BundleData(
                                    strPhone: _numberPhone[index].phone,
                                    StrGroup: _numberPhone[index].group,
                                    StrDate: _numberPhone[index].date);
                               Navigator.pushNamed(context, RouterGenerator.routeInformation, arguments: data);
                              },
                              leading: Icon(Icons.call_end_outlined, color: Colors.white ,),
                              title: Text(_numberPhone[index].phone,style: FontStyles.STYLE2,),
                              subtitle: Text(_numberPhone[index].group, style: TextStyle(color: Colors.blueAccent,fontSize: 14,fontWeight: FontWeight.w600),),
                            );
                          }):
                          Center(
                            child: Text(
                              'Not Empty', style: FontStyles.STYLE1,
                            ),)

                  )
                ],
              )),
        ),
      ),
    );
  }
}
