


import 'package:demo/base/Config.dart';
import 'package:demo/base/utils/ImageHelper.dart';
import 'package:demo/base/utils/UIHelper.dart';
import 'package:demo/base/view/BasePage.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends BasePage {
  @override
  Widget getView() {


    return Column(
      children: [
        getStatusBar(),
        Padding(
          padding: UIHelper.only(top: 45,left: 20),
          child: Row(
            children: [
              Expanded(
                child: ImageHelper.loadWH(Config.logo_url,width: 70,height: 70),
              )



            ],
          ),

        )

      ],

    );
  }


}
