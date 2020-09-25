
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatusBarWidget extends StatelessWidget {

  Color color = Colors.white;


  StatusBarWidget(this.color);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: color,
      height: Adapt.statusBarH,
    );
  }
}
