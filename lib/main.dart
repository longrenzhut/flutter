import 'package:demo/base/BaseApp.dart';
import 'package:demo/base/cache/Cache.dart';
import 'package:demo/base/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'app/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  BaseApp.init();
  runApp(App());

  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return RefreshConfiguration(
      hideFooterWhenNotFull: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,//主题色
          primaryColor: Colors.white,//导航栏颜色
          canvasColor: Colors.white,//画布颜色
          buttonTheme: ButtonThemeData(minWidth: double.minPositive, height: double.minPositive),

        ),
        home: SplashPage(),
      ),
    );

  }
}


//StatelessWidget
//class Splash extends BasePage{
//
//
//  @override
//  Widget getView() {
//    return Container(
//      width: ,
//    )
//  }
//
//}