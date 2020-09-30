

import 'package:demo/base/adapter/BaseAdapter.dart';
import 'package:demo/base/utils/Adapt.dart';
import 'package:flutter/material.dart';

class ListZ{

  static Widget build<T>(BaseAdapter<T> adapter,{EdgeInsetsGeometry padding  = const EdgeInsets.all(0),
    bool shrinkWrap: false,
    ScrollController controller,
    Widget header,
    List<Widget> headers,
  }){



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