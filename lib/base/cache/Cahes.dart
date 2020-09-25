

import 'package:demo/base/cache/Cache.dart';

class Caches{


  static var USER = "user";

  static Cache getVar(){

    return Cache.instance();
  }


}