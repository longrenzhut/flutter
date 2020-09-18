
import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';

import 'http/HttpProvider.dart';
import 'router/navigate_service.dart';
import 'router/routes.dart';
import 'utils/Adapt.dart';

class BaseApp{

  static Router _router;


  static Router get router => _router;

  static void init(){

    Adapt.getInstance().init();
    HttpProvider.init();
    _router = Router();
    Routes.configureRoutes(router);

    GetIt.instance.registerSingleton(NavigateService());

  }

}