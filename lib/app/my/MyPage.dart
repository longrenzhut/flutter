

import 'package:demo/base/provider/provider_widget.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:demo/base/widget/view/PtrWidget.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'viewmodel/MyVM.dart';

class MyPage extends BasePage{



  @override
  Widget getView(BuildContext context) {

    return ProviderWidget<MyVM>(
      model: MyVM(),
      isInit: true,
      onModelReady: (model){
        model.getUserInfo();
      },
      builder: (context,model,child){
        return model.loadAnim(
            child: getRefreshView(model)
        );
      },

    );
  }

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  Widget getRefreshView(MyVM model){

    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(),
        footer: ClassicFooter(),
        controller: _refreshController,
        onRefresh:() async{

        },
        child:ListView(
          children: [
            getStatusBar(),
            LinearLayout(
              bgColor: MyColors.white,
              padding: UIHelper.only(top: 30,left: 20),
              children: [
                ImageHelper.loadWH("",width: 60,height: 60),
                LinearLayout(
                  direction: Axis.vertical,
                  children: [
                    TextView("11")
                  ],
                )

              ],
            )

          ],
        )
    );

  }





}