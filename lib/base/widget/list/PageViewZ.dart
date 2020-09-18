

import 'package:demo/base/adapter/BaseAdapter.dart';
import 'package:flutter/material.dart';

class PageViewZ{


  static Widget build<T>(BaseAdapter<T> adapter,{
    PageController controller,
    Axis scrollDirection : Axis.horizontal,
    ScrollPhysics physics: const PageScrollPhysics()
}){

    return PageView.builder(

      controller: controller,

      physics: physics,
      itemCount: adapter.getItemCount(),
      itemBuilder:(BuildContext context,int index){
        return adapter.onCreateViewHolder(context, index);
      },
      scrollDirection: scrollDirection,//Axis.horizontal,
    );

  }

}