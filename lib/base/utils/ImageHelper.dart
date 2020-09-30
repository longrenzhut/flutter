import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/base/utils/BaseUtils.dart';
import 'package:flutter/material.dart';

import 'Adapt.dart';
import 'UIHelper.dart';

class ImageHelper {

  static String png(String name) {
    return "images/$name";
  }

  static Widget asset(String name, {double width, double height, BoxFit boxFit = BoxFit.fitHeight}) {
    var w = width == null ? null: Adapt.setWidth(width);
    var h = height == null ? null: Adapt.setWidth(height);
    return Image.asset(
      png(name),
      width: w,
      height: h,
      fit: boxFit,
    );
  }

  static AssetImage assetImage(String name, ) {
    return AssetImage(
      png(name),
    );
  }

  static IconButton iconBtn(String name,{double width, double height
    ,Function f
    ,Alignment alignment = Alignment.centerLeft
    ,EdgeInsets padding = const EdgeInsets.all(8)
  }) {
    return IconButton(
        alignment: alignment,
        color: Colors.white,
        icon: asset(name,width: width,height: height),
        splashColor: Colors.grey[100],
        highlightColor: Colors.grey[100],
        padding: padding,
        onPressed: f,
    );
  }

  static Widget loadWH(String url,{Object width,Object height}){
    if(BaseUtils.isEmpty(url))
      return  Container(
        width: Adapt.setWidth(width),
        height: Adapt.setWidth(width),
        color: Colors.grey[500],
      );
    Object newWidth = width == 0 ? null :Adapt.setWidth(width);
    return CachedNetworkImage(
      imageBuilder: (context,provider){
        return Image(image: provider, width: newWidth,height: Adapt.setWidth(height),
            fit:BoxFit.fitWidth);
      },
      imageUrl: url,
//      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  static Widget loadCircle(String url,width){
    if(BaseUtils.isEmpty(url))
      return  Container(
        width: Adapt.setWidth(width),
        height: Adapt.setWidth(width),
        decoration: UIHelper.boxDecorationAllRadius(
            radius: Adapt.setWidth(width)/2,
            soild: Colors.grey[500]
        ),
      );
    return ClipRRect(
      borderRadius: BorderRadius.circular(Adapt.setWidth(width)/2),
      child: CachedNetworkImage(
        imageBuilder: (context,provider){
          return Image(image: provider, width: Adapt.setWidth(width),height: Adapt.setWidth(width),
          fit: BoxFit.fitWidth,);
        },
        imageUrl: url,

//      placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      )
    );
  }

}
