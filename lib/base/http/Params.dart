

import 'dart:collection';

import '../Config.dart';

class Params{

  Map<String,dynamic> map;

  final int type;

  Params({this.type = 0}){
    map = HashMap();

    put("version", "1.0");
    put("platform", "Android");
//    put("timestamp", System.currentTimeMillis()/1000);
    if(type == 0)
    put("size", 10);
  }


  void put(String key,dynamic value){
    map[key] = value;
  }



}