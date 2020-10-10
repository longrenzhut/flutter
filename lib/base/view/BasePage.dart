
import 'package:demo/base/provider/view_state_model.dart';
import 'package:demo/base/provider/view_state_widget.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/widget/view/StatusBarView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoadingDialog.dart';
// ignore: must_be_immutable
abstract class BasePage extends StatelessWidget {


  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    this.mContext = context;
    isInit = true;
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: getView(context),
    );
  }





  Widget getView(BuildContext context);


  Future show({Future<dynamic> requestCallBack,Function(dynamic value) doCallback}) {
    return showDialog(
        context: mContext,
        barrierDismissible: false,
        builder: (_) {
          return  NetLoadingDialog(
            requestCallBack: requestCallBack,
            doCallback:doCallback,
            outsideDismiss: false,
          );
        });
  }





  Widget statusBarView({Color color: MyColors.white}){
    return StatusBarView(color);
  }


  bool isInit = true;

  Widget setUiLoad<T extends ViewStateModel>(T model){
    debugPrint("刷新界面--->" + model.viewState?.toString());
    if(!isInit) {
      isInit = false;
      return null;
    }


    if (model.busy) {
      return ViewStateBusyWidget();
    }
    else if (model.error) {
      return ViewStateErrorWidget(onPressed: request);
    }
    else if (model.empty) {
      return ViewStateEmptyWidget();
    }
    else if (model.unAuthorized) {
      return ViewStateUnAuthWidget();
    }

    isInit = false;
    return null;
  }


  void request(){

  }




}

