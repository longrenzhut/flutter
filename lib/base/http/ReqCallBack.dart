
import 'package:flutter/material.dart';

import '../Config.dart';
import '../provider/view_state_model.dart';

class ReqCallBack {

  Function(Map<String,dynamic> map) onSuccess;
  Function onError;
  Function(int code) onFailed;
  VoidCallback onCompleted;
  ViewStateModel _viewStateModel;


  ViewStateModel get viewStateModel => _viewStateModel;

  ReqCallBack setViewModel(ViewStateModel value) {
    _viewStateModel = value;
    return this;
  }

  bool isToast = true;

  String key = "records";


  ReqCallBack({
    this.onSuccess,
    this.onError,
    this.onFailed,
    this.onCompleted,
    this.isToast: true,
    this.key: "records",
  });


  void onReqError(e, stackTrace, {String message}) {
    if(e != null)
      debugPrint('error--->\n' + e.toString());
    if(stackTrace != null)
      debugPrint('statck--->\n' + stackTrace.toString());
    if(null != onError)
      onError();

    _viewStateModel?.setError();
  }

  void onReqCompleted() {
    if(null != onCompleted)
      onCompleted();

    _viewStateModel?.setIdle();
  }

  void onReqFailed(int code) {
    if(null != onFailed)
      onFailed(code);
    _viewStateModel?.setIdle();
  }

  void onReqSuccess(Map<String, dynamic> result) {

//    String str;
//    if(Config.DEVELOP || Config.PRE || Config.TEST){
//      str = result.toString();
//    }

    if(null != onSuccess)
      onSuccess(result);
    _viewStateModel?.setIdle();
  }




}