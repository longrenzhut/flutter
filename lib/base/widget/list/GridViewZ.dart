
import 'package:demo/base/adapter/BaseGvAdapter.dart';
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

class GridViewZ{

  static Widget build<T>(BaseGvAdapter<T> adapter,{EdgeInsetsGeometry padding = const EdgeInsets.all(0)}){
   return GridView.builder(
        padding: padding,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: adapter.getSpanCount(),
            crossAxisSpacing: Adapt.setWidth(adapter.getHorSpcing()),
            mainAxisSpacing: Adapt.setWidth(adapter.getVerSpcing()),
            childAspectRatio: adapter.getchildAspectRatio()
        ),
        itemCount: adapter.getItemCount(),
        itemBuilder: (BuildContext context, int index) {
          return adapter.onCreateViewHolder(context, index);
        });
  }
}