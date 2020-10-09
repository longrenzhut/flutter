import 'file:///F:/flutterbase/flutterbase/lib/app/splash_page.dart';
import 'package:demo/app/main_page.dart';
import 'package:demo/app/my/page/SettingPage.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../utils/JsonUtils.dart';


class Routes {
  static String home = "/home";
  static String login = "/login";
  static String setting = "/home/setting";

  static Future<void> configureRoutes(router) async {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return null;//LoginPage();
        });


    router.define(home, handler: MyHandler(
        func: (_,map){
          return MainPage();
        }
    ));

    router.define(setting, handler: MyHandler(
        func: (_,map){
          return SettingPage();
        }
    ));


//    router.define(home, handler: MyHandler(
//        func: (_,map){
//          return TabPage();
//        }
//    ));
//
//    router.define(post_detail, handler: MyHandler(
//        func: (_,map){
//          String id = map["id"];
//          return PosDetailPage(id:id);
//        }
//    ));
  }
}


typedef Widget Func(
    BuildContext context, Map<String, dynamic> parameters);

class MyHandler extends Handler{
  final HandlerType type;
  final Func func;

  MyHandler({this.type = HandlerType.route, this.func}):
        super(type: type,handlerFunc:(_,map){
        Map<String, dynamic> param = {};
        if(map.length > 0) {
          map?.forEach((key, value) {
            param[key] = JsonUtils.fluroCnParamsDecode(value.first);
          });

        }
        return func(_,param);

      });
}
