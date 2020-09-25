
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/widget/view/StatusBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
abstract class BasePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return getView();
  }


  Widget getView();

  Widget show() {
    return new Center(child: new CircularProgressIndicator());
  }

  Color getBarColor(){
    return MyColors.white;
  }


  Widget getStatusBar(){
    return StatusBarWidget(getBarColor());
  }


//  Widget getHeaderView(){
//    return HeaderLayout(getBarColor());
//  }



}

