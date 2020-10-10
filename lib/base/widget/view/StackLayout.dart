

import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

class StackLayout extends StatelessWidget {

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final List<Widget> children;
  final Decoration decoration;
  final Color bgColor;
  final MainAxisSize mainAxisSize;
  final double height;
  final double width;
  final AlignmentGeometry alignment;
  final TextDirection textDirection;

  StackLayout({
    Key key,
    this.margin,
    this.padding,
    this.children,
    this.decoration,
    this.bgColor,
    this.mainAxisSize:MainAxisSize.max,
    this.alignment:AlignmentDirectional.topStart,
    this.height,
    this.width,
    this.textDirection,

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
      child: Stack(
        fit: StackFit.expand,
        alignment: alignment,
        children: children,
        textDirection: textDirection,
      ),
    );
  }
}

