
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

class StatusBarWidget extends StatelessWidget {

  Color color = Colors.transparent;


  StatusBarWidget({this.color}){
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: color,
      height: Adapt.statusBarH,
    );
  }
}
