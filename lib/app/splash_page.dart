

import 'package:demo/base/provider/provider_widget.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/viewmodel/SplashVM.dart';
import 'login/LoginPage.dart';
import 'main_page.dart';


class SplashPage extends BasePage{
  @override
  Widget getView(BuildContext context) {
    return  ProviderWidget<SplashVM>(
        model: SplashVM(),
        onModelReady: (model){
          model.delayed();
        },
        builder: (context,model,child){

            return getContentView(model.status);
        });
  }



  Widget getContentView(int status){

    Widget widget;
    switch(status){
      case 1:
        widget = Container(
          color: MyColors.cl_111928,
        );
        break;

      case 2:
        widget = MainPage();
        break;

      case 3:
        widget = LoginPage();
        break;
    }


    return widget;
  }

}