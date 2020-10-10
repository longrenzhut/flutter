


import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

class LinearLayout extends StatelessWidget {

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Axis direction;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Decoration decoration;
  final Color bgColor;
  final MainAxisSize mainAxisSize;
  final double height;
  final double width;

  LinearLayout({
    Key key,
    this.margin,
    this.padding,
    this.direction : Axis.vertical,
    this.children,
    this.crossAxisAlignment: CrossAxisAlignment.start,
    this.mainAxisAlignment: MainAxisAlignment.start,
    this.decoration,
    this.bgColor,
    this.mainAxisSize:MainAxisSize.max,
    this.height,
    this.width,

  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: null == height? height: Adapt.setHeight(height),
      width: null == width? width: Adapt.setWidth(width),
      margin: margin,
      padding: padding,
      decoration:decoration,
      color: bgColor,
      child: Flex(
          direction: direction,
          children: children,
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
      ),
    );
  }
}

