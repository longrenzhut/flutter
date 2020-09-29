

import 'package:demo/base/http/Params.dart';
import 'package:demo/base/http/ReqCallBack.dart';
import 'package:demo/base/model/UserModel.dart';
import 'package:demo/base/provider/view_state_model.dart';
import 'package:demo/base/utils/LoginHelper.dart';

class MyVM extends ViewStateModel{

  UserModel mUserModel;
  @override
  Future initData() {
    setBusy();

    var params = Params(type: 1);
    return  postP("admin/my/index", params, ReqCallBack(
        onSuccess:(map){
          var userModel = UserModel.fromJson(map);
          LoginHelper.instance().intoLogin(userModel);
          this.mUserModel = userModel;

        }
    ));
  }



}