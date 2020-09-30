

import 'package:demo/base/adapter/BaseAdapter.dart';
import 'package:demo/base/model/ItemModel.dart';
import 'package:demo/base/model/UserModel.dart';
import 'package:demo/base/provider/provider_widget.dart';
import 'package:demo/base/utils/Adapt.dart';
import 'package:demo/base/utils/BaseUtils.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:demo/base/widget/view/CustomTextView.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:demo/base/widget/view/RecyclerView.dart';
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
        child:getContentList()
    );

  }


  Widget getTop(UserModel model){

    return LinearLayout(
      direction: Axis.vertical,
      children: [
        getStatusBar(),
        LinearLayout(
          bgColor: MyColors.white,
          padding: UIHelper.only(top: 30,left: 20,bottom: 24),
          children: [
            ImageHelper.loadCircle(model?.headimgurl,60),
            LinearLayout(
              direction: Axis.vertical,
              margin: UIHelper.left(14),
              children: [
                TextView(BaseUtils.isEmpty(model?.nickname)? "" : model?.nickname,size: 20,color: MyColors.black, weight: FontWeight.w300,),
                SpaceWidget(8),
                CustomTextView("请认证",
                  padding: UIHelper.only(top: 5,left: 12,bottom: 5,right: 12),
                  size: 10,
                  radius: 3.0,
                  color: MyColors.cl_181400,)
              ],
            )
          ],
        ),
        LinearLayout(
          verAxisAlignment: CrossAxisAlignment.center,
          margin: UIHelper.horizontal(12),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ImageHelper.assetImage("ic_my_bg.png"),
                  fit: BoxFit.fitWidth
              )
          ) ,
          children: [
            LinearLayout(
              direction: Axis.vertical,
              margin: UIHelper.only(top:10,bottom: 10,left: 24),
              children: [
                TextView(model?.openTitle,size: 16,color: MyColors.cl_513D21,),
                SpaceWidget(8),
                TextView(model?.openContent,size: 14,color: MyColors.cl_513D21,),
              ],
            ),
            Spacer(flex: 1,),
            CustomTextView(model?.isAuth != 1? "立即开通" : "已开通",size: 14, color: MyColors.cl_222329,
              soild: MyColors.cl_F6F1EB,
              radius: 14.0,
              padding: UIHelper.verHorizontal(4,12),
              margin: UIHelper.right(10),

            ),
            SpaceWidget(14),
            Expanded(
              flex: 1,
              child: Container(
                height: 700,
                child: getContentList(),
              ),
            )
          ],
        ),

      ],
    );
  }



  List<ItemModel> list = [];

  var title = ["常见问题","意见反馈",
    "联系客服","系统设置"];

  var resources = [
    "ic_my_question.png","ic_my_agress.png",
    "ic_my_contact.png","ic_my_setting.png"
  ];

  Widget getContentList() {
    list.clear();
    for (int i = 0; i < title.length; i ++) {
      var item = ItemModel();
      item.title = title[i];
      item.url = resources[i];
      list.add(item);
    }

//    return ListView.builder(
//        itemCount: list.length,
//        itemBuilder: (BuildContext context, int index) {
//          var model = list[index];
//          return LinearLayout(
//            verAxisAlignment: CrossAxisAlignment.center,
//            height: 70,
//            padding: UIHelper.horizontal(12),
//            children: [
//              ImageHelper.asset(model.url, width: 20, height: 20),
//              SpaceWidget(12),
//              TextView(model.title, size: 14, color: MyColors.cl_333333,),
//              Spacer(flex: 1,),
//              ImageHelper.asset("ic_enter.png")
//
//            ],
//
//          );
//        });
//  }

    return RecyclerView.builder(
      adapter: BaseAdapter<ItemModel>(
        data: list,
          builder: (context,index,model){
            return LinearLayout(
              verAxisAlignment: CrossAxisAlignment.center,
              height: 70,
              padding: UIHelper.horizontal(12),
              children: [
                ImageHelper.asset(model.url,width: 20,height: 20),
                SpaceWidget(12),
                TextView(model.title,size: 14,color: MyColors.cl_333333,),
                Spacer(flex: 1,),
                ImageHelper.asset("ic_enter.png",width: 16,height: 16)

              ],

            );
          }
      ),
    );
  }



}