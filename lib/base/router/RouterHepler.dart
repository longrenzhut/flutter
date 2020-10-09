import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../BaseApp.dart';
import '../http/Bundle.dart';
import '../utils/JsonUtils.dart';
import 'routes.dart';

class RouterHepler{


  static _navigateTo(BuildContext context, String path,
      {
        Bundle bundle,
        bool replace = false,
        bool clearStack = false,
        Duration transitionDuration = const Duration(milliseconds: 250),
        RouteTransitionsBuilder transitionBuilder}) {


    StringBuffer param = StringBuffer(path);

    int len = 0;

    Map map = bundle?.getData();

    map?.forEach((key,value){
      if(len == 0) {
        String v = "?${key}=${JsonUtils.fluroCnParamsEncode(value)}";
        param.write(v);
      }
      else {
        param.write("&${key}=${JsonUtils.fluroCnParamsEncode(value)}");
      }
      len ++;
    });


    String newPath = param.toString();
    BaseApp.router.navigateTo(context, newPath,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.cupertino);
  }


  static void pop(BuildContext context,){
    BaseApp.router.pop(context);
  }

//  static void buildPostDetail(BuildContext context,String id){
//    Bundle bundle = Bundle();
//    bundle.putString("id", id);
//    _navigateTo(context,Routes.post_detail,bundle: bundle);
//  }

  static void buildHome(BuildContext context){
    _navigateTo(context,Routes.home,replace: true);
  }

  static void buildSetting(BuildContext context){
    _navigateTo(context,Routes.setting);
  }


}