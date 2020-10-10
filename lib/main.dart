import 'package:demo/base/BaseApp.dart';
import 'package:demo/base/cache/Cache.dart';
import 'package:demo/base/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
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
      headerBuilder: () => WaterDropHeader(),        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
      footerBuilder:  () => ClassicFooter(),        // Configure default bottom indicator
      headerTriggerDistance: 80.0,        // header trigger refresh trigger distance
      springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // custom spring back animate,the props meaning see the flutter api
      maxOverScrollExtent :100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
      maxUnderScrollExtent:0, // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted: true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed : true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
      enableBallisticLoad: true,
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