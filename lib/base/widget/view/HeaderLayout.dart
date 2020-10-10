


import 'package:demo/base/router/RouterHepler.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:demo/base/widget/view/StackLayout.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {

  final String title;
  final Widget child;
  final bool isIvLeft;

  HeaderLayout({Key key,this.title: "",this.isIvLeft: false,
    this.child: const SizedBox.shrink()
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StackLayout(
      height: 46,
      padding: UIHelper.horizontal(16),
      bgColor: Colors.white,
      alignment: AlignmentDirectional.center,
      children: [
        Align(
          child:  TextView(title,size: 16,color: MyColors.black, weight: FontWeight.w300,),
        ),
        Positioned(
          left: 0,
          child:  Offstage(
            offstage: !isIvLeft,
            child: ImageHelper.click("back.png",height: 28,width: 28,onClick: (){
              RouterHepler.pop(context);
            }),
          ),

        ),
        Positioned(
            right: 0,
            child:child
        )
      ],

    );
  }
//
//  @override
//  Widget build(BuildContext context) {
//    return LinearLayout(
//      bgColor: Colors.white,
//      height: 46,
//      direction: Axis.horizontal,
//      verAxisAlignment: CrossAxisAlignment.center,
//      horAxisAlignment: MainAxisAlignment.spaceBetween,
//      padding: UIHelper.horizontal(16),
//      children: [
//        Offstage(
//          offstage: !isIvLeft,
//          child: ImageHelper.asset("back.png",height: 28,width: 28),
//        ),
//        TextView(title,size: 16,color: MyColors.black, weight: FontWeight.w300,),
//        child
//      ],
//
//    );
//  }
}

