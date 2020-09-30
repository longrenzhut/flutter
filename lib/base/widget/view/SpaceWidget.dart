
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpaceWidget extends StatelessWidget {

  final double space;
  final Color color;


  SpaceWidget(this.space,{this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    double height = space;
    double width = space;


    return Container(
      color: color,
      height: Adapt.setWidth(height),
      width:  width == null? null :Adapt.setWidth(width),
    );
  }
}
