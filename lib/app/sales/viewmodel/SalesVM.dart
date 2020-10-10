import 'package:demo/app/sales/model/SalesModel.dart';
import 'package:demo/base/http/Params.dart';
import 'package:demo/base/http/ReqCallBack.dart';
import 'package:demo/base/provider/view_state_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SalesVM extends ViewStateModel{


  var refreshController = RefreshController(initialRefresh: false);



  @override
  Future request() {
    setBusy();
    var request = getSalesInfo();
    return request;
  }


  List<SalesModel> mSalesList;

  Future getSalesInfo(){
    var params = Params(type: 1);
    return getP("admin/sale/index", params, ReqCallBack(
        isList: true,
        key: "list",
        onSuccessList:(result){
          mSalesList = result.map<SalesModel>((item) => SalesModel.fromJson(item)).toList();
        }
    )).then((value) =>
        refreshController.refreshCompleted()
    );
  }



}
