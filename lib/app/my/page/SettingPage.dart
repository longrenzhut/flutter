import 'package:demo/base/view/BasePage.dart';
import 'package:demo/base/widget/view/HeaderLayout.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingPage extends BasePage{

  @override
  Widget getView(BuildContext context) {


    return LinearLayout(
      children: [
        HeaderLayout(title: "我的设置",isIvLeft: true,),
      ],

    );

  }
}
