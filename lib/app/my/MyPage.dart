

import 'package:demo/base/provider/provider_widget.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:flutter/cupertino.dart';

import 'viewmodel/MyVM.dart';

class MyPage extends BasePage{
  @override
  Widget getView() {



    return Container(
      color: MyColors.cl_111928,
    );

  }


  Widget getContentView(){

    return ProviderWidget<MyVM>(
      model: MyVM(),
      onModelReady: (model){

      },
      builder: (context,model,child){

      },

    );
  }



}