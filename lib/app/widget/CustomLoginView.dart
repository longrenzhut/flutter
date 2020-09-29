

import 'package:demo/base/utils/MyColors.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/widget/view/EditView.dart';
import 'package:demo/base/widget/view/LineView.dart';
import 'package:demo/base/widget/view/SpaceWidget.dart';
import 'package:demo/base/widget/view/TextView.dart';
import 'package:flutter/material.dart';

class CustomLoginView extends StatelessWidget{


  final String title;
  final int type;
  final String hint;
  final TextEditingController controller;

  CustomLoginView(this.title,{
    this.type,
    this.controller,
    this.hint = "请输入"
  });

  @override
  Widget build(BuildContext context) {

    var widget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextView(title,size: 18,color: MyColors.cl_24282C,),
            Spacer(),

          ],
        ),
        SpaceWidget(4),
        EditView(size: 14, hintColor: MyColors.cl_A5AAB4,
          color: MyColors.cl_24282C, hint: hint,
          controller: controller,
          padding: UIHelper.vertical(8),
        ),
        LineView()
      ],
    );


    return widget;
  }

}
