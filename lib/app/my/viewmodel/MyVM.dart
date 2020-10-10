

import 'package:demo/base/http/Params.dart';
import 'package:demo/base/http/ReqCallBack.dart';
import 'package:demo/base/model/UserModel.dart';
import 'package:demo/base/provider/view_state_model.dart';
import 'package:demo/base/utils/LoginHelper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyVM extends ViewStateModel{

  UserModel mUserModel;

  var refreshController = RefreshController(initialRefresh: false);


  @override
  Future request() {
    setBusy();
    var request = getUserInfo();
    return request;
  }



  Future getUserInfo(){
    var params = Params(type: 1);
    return postP("admin/my/index", params, ReqCallBack(
        onSuccess:(map){
          var userModel = UserModel.fromJson(map);
          LoginHelper.instance().intoLogin(userModel);
          this.mUserModel = userModel;

        }
    )).then((value) =>
        refreshController.refreshCompleted()
    );
  }



}