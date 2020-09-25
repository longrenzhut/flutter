

class Config{


  //是否是开发
  static final bool DEVELOP = false;
  //是否是测试
  static final bool TEST = true;
  //是否是预发布环境
  static final bool PRE = false;

  /**
   * 开发环境
   */
    static final String JAVA_URL_DEV = "";//java
    static final String PHP_URL_DEV = "";//php
    static final String DEV_UPLOAD = "";//文件

  /**
   * 测试环境
   **/
    static final String JAVA_URL_TEST = "";//java
    static final String PHP_URL_TEST = "http://yipinapi.51youshop.com/";//php
    static final String TEST_UPLOAD = "";//文件

  /**
   * 预发布环境
   **/
    static final String JAVA_URL_PRE = "";//java
    static final String PHP_URL_PRE  = "";//php
    static final String UPLOAD_PRE  = "";//文件

  /**
   * 正式环境
   **/
    static final String JAVA_URL = "";//java
    static final String PHP_URL = "";//php
    static final String UPLOAD = "";//文件


  static final String logo_url = "https://yipin-app.oss-cn-beijing.aliyuncs.com/logo.png";

  //是否是预发布环境
  static  bool isLogin = false;
  static  String  token = "";
}