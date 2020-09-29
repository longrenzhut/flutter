

import 'package:demo/base/utils/Adapt.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineView extends Container {

  final int top;
  final int right;
  final int left;
  final int bottom;
  final Color color;
  final num height;
  final num width;

  LineView({
    this.color = MyColors.cl_DDE1E8,
    this.top = 0,
    this.right = 0,
    this.left = 0,
    this.bottom = 0,
    this.height = 0.5,
    this.width = double.maxFinite
  }) :super(
    padding: UIHelper.only(top: top, left: left, right: right, bottom: bottom),
    color: color,
    width: width == double.maxFinite? double.maxFinite : Adapt.setWidth(width),
    height: height == double.maxFinite? double.maxFinite : Adapt.setWidth(height),
  );
}
