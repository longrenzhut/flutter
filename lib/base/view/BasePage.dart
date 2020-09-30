
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



  Color getBarColor(){
    return MyColors.white;
  }


  Widget statusBarView(){
    return StatusBarView(getBarColor());
  }


//  Widget getHeaderView(){
//    return HeaderLayout(getBarColor());
//  }



}

