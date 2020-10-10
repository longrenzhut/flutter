import 'package:demo/base/adapter/BaseAdapter.dart';
import 'package:demo/base/model/ItemModel.dart';
import 'package:demo/base/router/RouterHepler.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/LoginHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/ToastUtil.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:demo/base/widget/view/CustomTextView.dart';
import 'package:demo/base/widget/view/HeaderLayout.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:demo/base/widget/view/SpaceWidget.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingPage extends BasePage{


  @override
  Widget getView(BuildContext context) {


    return LinearLayout(
      children: [
        statusBarView(),
        HeaderLayout(title: "我的设置",isIvLeft: true,),
        switchWidget("收款通知"),
        switchWidget("订单通知"),
        itemEnterWidget("检查更新",content: "V1.0.0"),
        SpaceWidget(10),
        itemEnterWidget("隐私协议"),
        itemEnterWidget("免责条款"),
        SpaceWidget(10),
        itemEnterWidget("服务协议"),
        itemEnterWidget("关于我们"),

        SpaceWidget(20),
        CustomTextView("退出登录",
          height: 47,
          margin: UIHelper.horizontal(20),
          size: 18,
          radius: 8.0,
          color: MyColors.black,
          onTap: (){
              LoginHelper.instance().logout();
              RouterHepler.buildLogin(context);
          },
        ),

      ],

    );
  }


  Widget switchWidget(String title){

    var isOpen = false;

    return LinearLayout(
      bgColor: MyColors.white,
      height: 70,
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,
      padding: UIHelper.horizontal(16),
      children: [
        TextView(title,size: 16,color: MyColors.cl_333333,),
        Spacer(flex: 1,),
        Switch(value: isOpen,
            onChanged:(value){
              isOpen = value;
            })
      ],
    );
  }


  Widget itemEnterWidget(String title,{String content}){

    var child = InkWell(
      child: LinearLayout(
        height: 70,
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: UIHelper.horizontal(16),
        children: [
          TextView(title,size: 16,color: MyColors.cl_333333,),
          Spacer(flex: 1,),
          TextView(content,size: 14,color: MyColors.cl_333333,),
          ImageHelper.asset("ic_enter.png",width: 16,height: 16)
        ],
      ),
      onTap: (){

      },
    );

    return Ink(
      child: child,
      color: MyColors.white,
    );
  }

}
