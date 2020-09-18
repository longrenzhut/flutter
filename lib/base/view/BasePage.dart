
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
abstract class BasePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return getView();
  }


  Widget getView();

  Widget show() {
    return new Center(child: new CircularProgressIndicator());
  }

}

