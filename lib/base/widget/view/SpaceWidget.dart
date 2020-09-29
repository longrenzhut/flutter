
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpaceWidget extends StatelessWidget {

  final double space;
  final Color color;

  bool isVerSpace = true;

  SpaceWidget(this.space,{this.color = Colors.transparent,this.isVerSpace = true});

  @override
  Widget build(BuildContext context) {
    double height = isVerSpace? space: 1;
    double width = isVerSpace? null: space;


    return Container(
      color: color,
      height: Adapt.setWidth(height),
      width:  width == null? null :Adapt.setWidth(width),
    );
  }
}
