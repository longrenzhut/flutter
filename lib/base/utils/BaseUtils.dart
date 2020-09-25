

import 'package:gson/gson.dart';

class BaseUtils{



  static toJson(Map<String,dynamic> map){
    gson.encode(map,quoteMapKeys: true);
  }

  static Map<String,dynamic> fromJson(String value){
    return gson.decode(value);
  }


}