import 'package:demo/app/sales/model/SalesModel.dart';
import 'package:demo/app/sales/viewmodel/SalesVM.dart';
import 'package:demo/base/adapter/BaseAdapter.dart';
import 'package:demo/base/provider/provider_widget.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:demo/base/widget/view/HeaderLayout.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:demo/base/widget/view/RecyclerView.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// ignore: must_be_immutable
class SalesPage extends BasePage{


  SalesVM mSalesVM;

  @override
  Widget getView(BuildContext context) {

    return ProviderWidget<SalesVM>(
      model: mSalesVM = SalesVM(),
      onModelReady: (model){
        model.request();
      },
      builder: (context,model,child) {
        return model.setUILoad(getRoot(), isInit);
      },
    );

  }


  Widget getRefreshView(){
    return SmartRefresher(
        enablePullDown: true,
        footer: ClassicFooter(),
        controller: mSalesVM.refreshController,
        onRefresh:() {
          mSalesVM.getSalesInfo();
        },
        child:getSalesList()
    );

  }


  Widget getSalesList(){

    return RecyclerView.builder(
      adapter: BaseAdapter<SalesModel>(
        data: mSalesVM.mSalesList,
        builder: (context,index,model){

          return SalesItemWidget(model);
        }
      )
    );
  }


  Widget SalesItemWidget(SalesModel model){

    return Container(
      height: 50,
      child: TextView(model.name,size: 16,color: MyColors.black,),
    );
  }



  Widget getRoot(){

    return Stack(
      children: [
        ImageHelper.asset("ic_main_bg.png"),
        LinearLayout(
          children: [
            statusBarView(),
            HeaderLayout(title: "营销",bgColor: Colors.transparent,),
            getRefreshView()

          ],
        )

      ],

    );

  }


}