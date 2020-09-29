import 'package:demo/base/http/Params.dart';
import 'package:demo/base/http/ReqCallBack.dart';
import 'package:demo/base/model/UserModel.dart';
import 'package:demo/base/provider/view_state_model.dart';
import 'package:demo/base/utils/LoginHelper.dart';

class LoginVM extends ViewStateModel{


  Future loginByPhone(String phone,String password) {
    var params = Params(type: 1);
    params.put("phone", phone);
    params.put("password", password);
    params.put("device_id", "Ah1gF0a-0u78GHTmYAzXg9fNej_T_6I3WS5rky0s07KJ");
   return postP("admin/index/login", params, ReqCallBack(
        onSuccess:(map){
          var userModel = UserModel.fromJson(map);
          LoginHelper.instance().intoLogin(userModel);

        }
    ));
  }




}
