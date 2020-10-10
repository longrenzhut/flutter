/// id : 1
/// name : "会员卡"
/// img : ""
/// brief : ""
/// use_num : "0店铺在使用"
/// update_time : "-"
/// is_click : 1

class SalesModel {
  int _id;
  String _name;
  String _img;
  String _brief;
  String _useNum;
  String _updateTime;
  int _isClick;
  String _clickMsg;


  String get clickMsg => _clickMsg;

  set clickMsg(String value) {
    _clickMsg = value;
  }

  int get id => _id;
  String get name => _name;
  String get img => _img;
  String get brief => _brief;
  String get useNum => _useNum;
  String get updateTime => _updateTime;
  int get isClick => _isClick;

  SalesModel({
      int id, 
      String name, 
      String img, 
      String brief, 
      String useNum, 
      String updateTime, 
      String clickMsg,
      int isClick}){
    _id = id;
    _name = name;
    _img = img;
    _brief = brief;
    _useNum = useNum;
    _updateTime = updateTime;
    _isClick = isClick;
    _clickMsg = clickMsg;
}

  SalesModel.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _img = json["img"];
    _brief = json["brief"];
    _useNum = json["use_num"];
    _updateTime = json["update_time"];
    _isClick = json["is_click"];
    _clickMsg = json["click_msg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["img"] = _img;
    map["brief"] = _brief;
    map["useNum"] = _useNum;
    map["updateTime"] = _updateTime;
    map["isClick"] = _isClick;
    return map;
  }

}