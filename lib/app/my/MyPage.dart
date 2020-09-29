

import 'package:demo/base/model/UserModel.dart';
import 'package:demo/base/provider/provider_widget.dart';
import 'package:demo/base/utils/BaseUtils.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:demo/base/widget/view/SpaceWidget.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'viewmodel/MyVM.dart';

class MyPage extends BasePage{


  MyVM mViewModel;

  @override
  Widget getView(BuildContext context) {

    return ProviderWidget<MyVM>(
      model: mViewModel = MyVM(),
      isInit: true,
      onModelReady: (model){
        model.initData();
      },
      builder: (context,model,child){
        return model.loadAnim(
            child: getRefreshView(model?.mUserModel)
        );
      },

    );
  }

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  Widget getRefreshView(UserModel model){
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(),
        footer: ClassicFooter(),
        controller: _refreshController,
        onRefresh:() {
          mViewModel.initData().then((value) => {
            _refreshController.refreshCompleted()
          });
        },
        child:ListView(
          children: [
            getStatusBar(),
            LinearLayout(
              bgColor: MyColors.white,
              padding: UIHelper.only(top: 30,left: 20,bottom: 40),
              children: [
                ImageHelper.loadCircle(model?.headimgurl,60),
                LinearLayout(
                  direction: Axis.vertical,
                  margin: UIHelper.left(14),
                  children: [
                    TextView(BaseUtils.isEmpty(model?.nickname)? "" : model?.nickname,size: 20,color: MyColors.black, weight: FontWeight.w300,),
                    SpaceWidget(8),

                  ],
                )
              ],
            )

          ],
        )
    );

  }





}