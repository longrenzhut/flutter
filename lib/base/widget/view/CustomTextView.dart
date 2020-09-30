

import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TextView.dart';

class CustomTextView extends StatelessWidget {

  final String title;
  final EdgeInsetsGeometry margin;
  final int size;
  final Color color;
  final Color soild;
  final num radius;
  final Function onTap;
  final num height;
  final num width;
  final EdgeInsetsGeometry padding;

  CustomTextView(this.title,{this.margin, this.size = 10, this.color= MyColors.black,
    this.soild = MyColors.cl_FEEA05, this.radius = 0.0,this.onTap,
    this.width,
    this.height ,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: height,
      padding: padding,
      width: width,
      margin: margin,
      decoration: UIHelper.boxDecorationAllRadius(soild: soild,
          radius: radius
      ),
      child: getView(),
    );
  }

  Widget getView(){
    if(onTap == null)
      return TextView(title,size: size,color: color);

    return InkWell(
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        child: TextView(title,size: size,color: color),
      ),
      onTap: onTap,
    );

  }

}
