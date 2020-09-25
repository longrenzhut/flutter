

import 'package:demo/base/provider/view_state_model.dart';

class MainVM extends ViewStateModel{



  int index = 0;


  void setIndex(int _index){
    this.index = _index;
    notifyListeners();
  }

}