import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';

class Common {
  TextFormField search({
    String labelText = '',
    String hintText = '',
    bool? validation,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? style,
    String? validationErrorMsg,
    Function(String value)? validationText,
    bool obscureText = false,
    bool isReadOnly = false,
    FocusNode? fn,
    Widget? icon,
    Function(String value)? callbackSearch,
    VoidCallback? callback,
  }) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: style,
      controller: controller,
      obscureText: obscureText,
      readOnly: isReadOnly,
      focusNode: fn,
      enableInteractiveSelection: true,
      validator: (val) {
        if (validation!) {
          if (val!.isEmpty) {
            return validationErrorMsg;
          } else {
            validationText!(val);
          }
        }
      },
      onChanged: (val) {
        callbackSearch!(val);
      },
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          fillColor: Colos.SEARCH,
          filled: true,
          prefixIcon: Transform.scale(
              scale: 1.4, child: Icon(Icons.search, color: Colors.white)),
          labelStyle: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'OpenSan'),
          hintStyle: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'Opensan'),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.5,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      onTap: () {
        callback!();
      },
    );
    return textFormField;
  }

  Future<void> goUrl(String strUrl) async {
    launchUrl(Uri.parse(strUrl));
  }
}
