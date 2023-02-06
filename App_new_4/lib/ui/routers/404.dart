import 'package:flutter/material.dart';
class WidgetNotFound extends StatelessWidget {
  const WidgetNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Page Not Found'),
      ),
    );
  }
}
