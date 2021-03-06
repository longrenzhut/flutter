import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base/utils/CstColors.dart';
import 'base/BaseApp.dart';
import 'base/router/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  BaseApp.init();
  runApp(ScreenUtilInit(
    designSize: Size(360, 690),
    allowFontScaling: false,
    child: MyApp(),
  ));

  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  RefreshConfiguration(
        headerBuilder: () => WaterDropHeader(),        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
        footerBuilder:  () => ClassicFooter(),        // Configure default bottom indicator
        headerTriggerDistance: 80.0,        // header trigger refresh trigger distance
        springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // custom spring back animate,the props meaning see the flutter api
        maxOverScrollExtent :100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
        maxUnderScrollExtent:0, // Maximum dragging range at the bottom
        enableScrollWhenRefreshCompleted: false, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
        enableLoadingWhenFailed : true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
        hideFooterWhenNotFull: false, // Disable pull-up to load more functionality when Viewport is less than one screen
        enableBallisticLoad: true, // trigger load more by BallisticScrollActivity
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // primarySwatch: Colors.green,//主题色
              primaryColor: Colors.white,//导航栏颜色
              canvasColor: CstColors.bgColor,//画布颜色
              buttonTheme: ButtonThemeData(minWidth: double.infinity, height: double.infinity,
                  layoutBehavior:ButtonBarLayoutBehavior.constrained)

          ),

          localeListResolutionCallback: (List<Locale> locales, Iterable<Locale> supportedLocales) {
            return Locale('zh');
          },
          //下拉刷新
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) {
            return locale;
          },

          supportedLocales: [
            const Locale('zh', 'CH'),
            const Locale('en', 'US'),
          ],
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          localizationsDelegates: [
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: Routes.initRouter,
          onGenerateRoute: (settings)=> Routes.onGenerateRoute(context,settings),
          onUnknownRoute: (settings)=> Routes.onGenerateRoute(context, settings),

        )
    );
  }
}
