
import 'package:flutter/material.dart';



class BaseAdapter<T>{



  List<T> data;


  bool isClick = true;

  Function(int index,T model) onItemClick;
  Widget Function(BuildContext context,int index, T model) builder;

  BaseAdapter({
    this.data,
    this.isClick = true,
    this.onItemClick,
    this.builder,
  }) {
  }


  void setOnItemCallback(Function(int index,T model) onItemClick){
    this.onItemClick = onItemClick;
  }


  BaseAdapter<T> setDatas(List<T> datas){
    this.data = datas;

    return this;
  }

  List<T> getDatas()=> data;


  int getItemCount(){
    int count = (null == data ? 0 : data.length);
    return count;
  }

  Widget onCreateViewHolder(BuildContext context, int index) {

    T model = data[index];
    return !isClick?
    builder(context,index,model):
    InkWell(
      onTap: (){
        if(null != onItemClick)
          onItemClick(index,model);
        else
          onItemClicked(context,index,model);
      },
      child: builder(context,index,model),
    );
  }

  void onItemClicked(BuildContext context, int index,T model){

  }


  double getDividerHeight(){
    return 0;
  }

  Color getDividerColor(){
    return Colors.transparent;
  }

}