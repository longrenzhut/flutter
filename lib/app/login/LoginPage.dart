


import 'package:demo/app/login/viewmodel/LoginVM.dart';
import 'package:demo/app/main_page.dart';
import 'package:demo/app/widget/CustomLoginView.dart';
import 'package:demo/base/Config.dart';
import 'package:demo/base/provider/provider_widget.dart';
import 'package:demo/base/router/RouterHepler.dart';
import 'package:demo/base/utils/Adapt.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/ToastUtil.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:demo/base/widget/view/CustomTextView.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:demo/base/widget/view/SpaceWidget.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends BasePage {



  @override
  Widget getView(BuildContext context) {

    var _accountController = TextEditingController();
    var _pwdController = TextEditingController();

    return ProviderWidget<LoginVM>(
      model: LoginVM(),
      builder: (context,model,child){

        var widget = SingleChildScrollView(
          child: getContentView(_accountController,_pwdController,model),

        );

        return widget;
      },
    );
  }


  Widget getContentView(TextEditingController _accountController,TextEditingController _pwdController,LoginVM model){
    return LinearLayout(
      bgColor: Colors.white,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statusBarView(),
        Padding(
          padding: UIHelper.only(top: 45,left: 20),
          child: Row(
            children: [
              ImageHelper.loadWH(Config.logo_url,width: 70,height: 70),
              Spacer(),
              InkWell(
                child:  Container(
                  padding: UIHelper.only(top: 7,bottom: 7,left: 15,right: 14),
                  decoration: UIHelper.boxDecorationRadius(
                      soild:MyColors.cl_33E19A00,
                      topLeftRadius: 16,
                      bottomLeftRadius: 16
                  ),
                  child: TextView("去注册",size: 16, color: MyColors.cl_E19A00,),
                ),
                onTap: (){

                },
              )
            ],
          ),
        ),

        SpaceWidget(22),
        Padding(
          padding: UIHelper.left(20),
          child: TextView("您好！欢迎使用怡品良铺",size: 21, color: MyColors.cl_252100,weight: FontWeight.w300,),
        ),
        SpaceWidget(55),
        Padding(
          padding: UIHelper.horizontal(20),
          child: CustomLoginView("账号",hint: "请输入账号",controller: _accountController,),
        ),
        SpaceWidget(32),
        Padding(
          padding: UIHelper.horizontal(20),
          child: CustomLoginView("密码",hint: "请输入密码",controller: _pwdController,),
        ),
        SpaceWidget(40),
        Container(
          alignment: Alignment.topRight,
          padding: UIHelper.right(20),
          child: InkWell(
            child: TextView("忘记密码？",size: 18,color: MyColors.cl_E19A00,),
            onTap: (){

            },
          ),
        ),
        SpaceWidget(20),
        CustomTextView("登陆",
          height: 47,
          margin: UIHelper.horizontal(20),
          size: 18,
          radius: 8.0,
          color: MyColors.black,
          onTap: (){
            if(_accountController.text.isEmpty){
              ToastUtil.showToast("账号不能为空");
              return;
            }
            if(_pwdController.text.isEmpty){
              ToastUtil.showToast("密码不能为空");
              return;
            }
            show(
                requestCallBack: model.loginByPhone(_accountController.text,_pwdController.text),
                doCallback: (value){
                    RouterHepler.buildHome(mContext);
                }
            );

          },
        )

      ],

    );
  }


}
