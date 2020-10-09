


import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/widget/view/LinearLayout.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {

  final String title;
  final bool isIvLeft;

  HeaderLayout({Key key,this.title: "",this.isIvLeft: true}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      height: 46,
      verAxisAlignment: CrossAxisAlignment.center,
      padding: UIHelper.vertical(16),
      children: [
        Offstage(
          offstage: !isIvLeft,
          child: ImageHelper.asset("back.png",height: 28,width: 28),
        ),
        TextView(title,size: 16,color: MyColors.black, weight: FontWeight.w300,)

      ],

    );
  }
}

