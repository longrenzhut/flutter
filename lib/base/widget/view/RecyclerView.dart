import 'package:demo/base/adapter/BaseAdapter.dart';
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

class RecyclerView extends ListView{



  static Widget builder({
    EdgeInsetsGeometry padding,
    ScrollController controller,
    bool shrinkWrap = false,
    BaseAdapter adapter
}){


    if(adapter.getDividerHeight() == 0){
      return ListView.builder(
          padding: padding,
          controller: controller,
          shrinkWrap: shrinkWrap,
          itemCount: adapter.getItemCount(),
          itemBuilder: (BuildContext context, int index) {
            return adapter.onCreateViewHolder(context, index);
          },
      );
    }

    return ListView.separated(
        padding: padding,
        controller: controller,
        shrinkWrap: shrinkWrap,
        itemCount: adapter.getItemCount(),
        itemBuilder: (BuildContext context, int index) {
          return adapter.onCreateViewHolder(context, index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return  Divider(
              height:  Adapt.setWidth(adapter.getDividerHeight()),
              color: adapter.getDividerColor());
        }
    );

  }

}
