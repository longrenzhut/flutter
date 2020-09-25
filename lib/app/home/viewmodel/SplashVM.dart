

import 'package:demo/base/Config.dart';
import 'package:demo/base/provider/view_state_model.dart';

class SplashVM extends ViewStateModel{




  int status = 1;

   void delayed(){
    Future.delayed(Duration(milliseconds: 2000), () {
      if(Config.isLogin){
        status = 2;
      }
      else{
        status = 3;
      }
      notifyListeners();
    });
  }


}