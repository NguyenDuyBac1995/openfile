import 'package:app_new_2/ui/screens/widgets/utils/colors.dart';
import 'package:flutter/material.dart';


TextField TextFieldFontV1(BuildContext Context,  {String? hinText , TextEditingController? text  }){
return TextField(
  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
  controller: text,
  decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.7, color: Colors.white),
      borderRadius: BorderRadius.circular(10)
    ),
    filled: true,
    fillColor: Colos.BOTTOMNAVIGATOR_COLOR,
    hintText: hinText ?? '',
    hintStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),
    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
}

TextField TextFieldFontV2(BuildContext Context, { String? hinText , TextEditingController? textController , text}){
  return TextField(
    onChanged: (value){return text(value);},
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
    controller: textController,
    decoration: InputDecoration(
      prefixIcon: Transform.scale(
          scale: 1.4,
          child: Icon(Icons.search, color: Colors.white)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.7, color: Colors.white),
          borderRadius: BorderRadius.circular(6)
      ),
      filled: true,
      fillColor: Colos.BOTTOMNAVIGATOR_COLOR,
      hintText: hinText ?? '',
      hintStyle: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w400),
      contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}

TextField TextFieldFontV3(BuildContext Context, { String? hinText , TextEditingController? textController2 }){
  return TextField(
    minLines: 2,
    maxLines: 5,
    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
    controller: textController2,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.7, color: Colors.white),
          borderRadius: BorderRadius.circular(10)
      ),
      filled: true,
      fillColor: Colos.BOTTOMNAVIGATOR_COLOR,
      hintText: hinText ?? '',
      hintStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 18),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}