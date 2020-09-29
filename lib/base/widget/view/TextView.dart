

import 'package:demo/base/utils/Adapt.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:flutter/material.dart';

class TextView extends Text{


  final String data;


  TextView(this.data,{int size = 10,Color color = Colors.transparent,FontWeight weight}) : super(data,
      style: TextStyle(
          fontSize: Adapt.setTextSp(size),
          color: color,
          fontWeight: weight
      )
  );


}