
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpaceWidget extends StatelessWidget {

  final double space;
  final Color color;

  final bool vertical;

  SpaceWidget(this.space,{this.color = Colors.transparent,this.vertical = true});

  @override
  Widget build(BuildContext context) {
    double height = vertical? space: 1;


    return Container(
      color: color,
      height: Adapt.setHeight(height),
      width:  vertical? null : Adapt.setWidth(space)
    );
  }
}
