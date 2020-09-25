

import 'package:demo/app/home/HomePage.dart';
import 'package:demo/app/home/viewmodel/MainVM.dart';
import 'package:demo/app/my/MyPage.dart';
import 'package:demo/app/sales/SalesPage.dart';
import 'package:demo/app/users/UsersPage.dart';
import 'package:demo/base/provider/provider_widget.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/material.dart';

class MainPage extends BasePage{


  var titles  = ["首页","用户","营销","我的"];

  var resources = ["ic_home.png",
    "ic_users.png",
    "ic_marketing.png",
    "ic_my.png"
  ];

  var resourcesSel = ["ic_home_selector.png",
    "ic_users_selector.png",
    "ic_marketing_selector.png",
    "ic_my_selector.png"
  ];

  List<BottomNavigationBarItem> itemList = [];


  List<Widget> pageList = [HomePage(),UsersPage(),SalesPage(),MyPage()];

  @override
  Widget getView() {
    var widget = ProviderWidget<MainVM>(
      onModelReady: (model){

      },
      model: MainVM(),
      builder: (contex, model,  child){

        itemList.clear();
        for(int i = 0; i < titles.length;i++){

          var item = BottomNavigationBarItem(
              icon: ImageHelper.asset(model.index == i?resourcesSel[i]:resources[i],width: 20, height: 20,),
              title: TextView(titles[i],size: 11, color: getColorSelected(model.index,i))

          );
          itemList.add(item);
        }
        return Scaffold(
          body: pageList[model.index],
          bottomNavigationBar: BottomNavigationBar( // 底部导航
              onTap: (value){
                model.setIndex(value);
              },
              items: itemList,
              type:BottomNavigationBarType.fixed

          ),
        );

      },
    );

    return widget;
  }

  Color getColorSelected(int index,int curIndex){
    return index == curIndex ? MyColors.black: MyColors.cl_727066;
  }




}