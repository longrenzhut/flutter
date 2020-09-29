


import 'package:flutter/cupertino.dart';

class LinearLayout extends StatelessWidget {

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Axis direction;
  final List<Widget> children;
  final MainAxisAlignment horAxisAlignment;
  final CrossAxisAlignment verAxisAlignment;
  final Decoration decoration;
  final Color bgColor;
  final MainAxisSize mainAxisSize;

  LinearLayout({
    Key key,
    this.margin,
    this.padding,
    this.direction : Axis.horizontal,
    this.children,
    this.verAxisAlignment: CrossAxisAlignment.start,
    this.horAxisAlignment: MainAxisAlignment.start,
    this.decoration,
    this.bgColor,
    this.mainAxisSize:MainAxisSize.max,

  }):super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin,
      padding: padding,
      decoration:decoration,
      color: bgColor,
      child: Flex(
          direction: direction,
          children: children,
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: horAxisAlignment,
          crossAxisAlignment: verAxisAlignment,
      ),
    );
  }
}

