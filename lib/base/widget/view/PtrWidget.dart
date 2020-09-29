


import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PtrWidget extends SmartRefresher{

  PtrWidget({Key key,
    RefreshController controller,
    Widget child,
    VoidCallback onRefresh,
    VoidCallback onLoading,
    bool enablePullDown: true,
    bool enablePullUp: true,
  }):super(
    key: key,
    controller: controller,
    child: child,
    header: WaterDropHeader(),
    footer: ClassicFooter(),
    onRefresh: onRefresh,
    onLoading: onLoading,
    enablePullDown: enablePullDown,
    enablePullUp: enablePullUp,

  );
}
