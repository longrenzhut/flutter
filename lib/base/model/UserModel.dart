/// is_auth : 0
/// auth_name : "怡品商户"
/// is_open : 0
/// open_title : "怡品SVIP"
/// open_content : "覆盖掌柜门店全功能"
/// nickname : ""
/// headimgurl : ""
/// is_order_push : 1
/// is_buy_notice : 1
/// qq : "928487318"
/// phone : "18782559175"

class UserModel {
  int _isAuth;
  String _authName;
  int _isOpen;
  String _openTitle;
  String _openContent;
  String _nickname;
  String _headimgurl;
  int _isOrderPush;
  int _isBuyNotice;
  String _qq;
  String _phone;
  String _token;

  int get isAuth => _isAuth;
  String get authName => _authName;
  int get isOpen => _isOpen;
  String get openTitle => _openTitle;
  String get openContent => _openContent;
  String get nickname => _nickname;
  String get headimgurl => _headimgurl;
  int get isOrderPush => _isOrderPush;
  int get isBuyNotice => _isBuyNotice;
  String get qq => _qq;
  String get phone => _phone;
  String get token => _token;

  UserModel({
      int isAuth, 
      String authName, 
      int isOpen, 
      String openTitle, 
      String openContent, 
      String nickname, 
      String headimgurl, 
      int isOrderPush, 
      int isBuyNotice, 
      String qq, 
      String phone,
      String token,
  }){
    _isAuth = isAuth;
    _authName = authName;
    _isOpen = isOpen;
    _openTitle = openTitle;
    _openContent = openContent;
    _nickname = nickname;
    _headimgurl = headimgurl;
    _isOrderPush = isOrderPush;
    _isBuyNotice = isBuyNotice;
    _qq = qq;
    _phone = phone;
    _token = token;
}

  UserModel.fromJson(dynamic json) {
    _isAuth = json["isAuth"];
    _authName = json["authName"];
    _isOpen = json["isOpen"];
    _openTitle = json["openTitle"];
    _openContent = json["openContent"];
    _nickname = json["nickname"];
    _headimgurl = json["headimgurl"];
    _isOrderPush = json["isOrderPush"];
    _isBuyNotice = json["isBuyNotice"];
    _qq = json["qq"];
    _phone = json["phone"];
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["isAuth"] = _isAuth;
    map["authName"] = _authName;
    map["isOpen"] = _isOpen;
    map["openTitle"] = _openTitle;
    map["openContent"] = _openContent;
    map["nickname"] = _nickname;
    map["headimgurl"] = _headimgurl;
    map["isOrderPush"] = _isOrderPush;
    map["isBuyNotice"] = _isBuyNotice;
    map["qq"] = _qq;
    map["phone"] = _phone;
    map["token"] = _token;
    return map;
  }

}