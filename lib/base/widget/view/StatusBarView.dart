
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatusBarView extends StatelessWidget {

  Color color = Colors.white;


  StatusBarView(this.color);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: color,
      height: Adapt.getStaBarH(),
    );
  }
}
