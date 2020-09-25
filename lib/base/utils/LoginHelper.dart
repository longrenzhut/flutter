
import 'package:demo/base/Config.dart';
import 'package:demo/base/cache/Cahes.dart';
import 'package:demo/base/model/UserModel.dart';
import 'package:demo/base/utils/BaseUtils.dart';

class LoginHelper {
  static LoginHelper inst;

  static LoginHelper instance(){
    if(null == inst)
      inst = LoginHelper();

    return inst;
  }

  UserModel mUserModel;

  void init(){
    var userInfo = Caches.getVar().getString(Caches.USER);
    if(userInfo.isEmpty){
      return;
    }
    mUserModel = UserModel.fromJson(userInfo);
    Config.isLogin = true;
    Config.token = mUserModel?.token;
  }


  getUser()=> mUserModel;

  void intoLogin(UserModel model){
    mUserModel = model;
    Config.isLogin = true;
    Config.token = model?.token;
  }

}
