
import 'package:demo/base/utils/BaseUtils.dart';
import 'package:flutter/material.dart';

import '../Config.dart';
import '../provider/view_state_model.dart';

class ReqCallBack {

  Function(Map<String,dynamic> map) onSuccess;
  Function(dynamic list) onSuccessList;
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

  final String key;

  final bool isList;


  ReqCallBack({
    this.onSuccess,
    this.onError,
    this.onFailed,
    this.onSuccessList,
    this.onCompleted,
    this.isToast: true,
    this.isList: false,
    this.key: "",
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

  }

  void onReqFailed(int code) {
    if(null != onFailed)
      onFailed(code);
    _viewStateModel?.setIdle();
  }

  void onReqSuccess(result) {
    if(isList && null != onSuccessList){
      if(BaseUtils.isEmpty(key)){
        onSuccessList(result);
      }
      else{
        onSuccessList(result[key]);
      }
    }
    else{
      if(null != onSuccess)
        onSuccess(result);
    }

    _viewStateModel?.setIdle();
  }




}