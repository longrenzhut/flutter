

import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

class TextView extends Text{


  String data;


  TextView(this.data,{int size,Color color,FontWeight weight}) : super(data,
      style: TextStyle(
          fontSize: Adapt.setTextSp(size),
          color: color,
          fontWeight: weight
      )
  );


}