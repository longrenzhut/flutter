
import 'dart:convert';

import 'package:demo/base/utils/BaseUtils.dart';
import 'package:demo/base/utils/JsonUtils.dart';
import 'package:dio/dio.dart';

import '../Config.dart';
import '../utils/ToastUtil.dart';
import 'Params.dart';
import 'ReqCallBack.dart';

class HttpProvider {


  static String getJavaUrl() {
    if (Config.DEVELOP)
      return Config.JAVA_URL_DEV;
    if (Config.TEST)
      return Config.JAVA_URL_TEST;
    if (Config.PRE)
      return Config.JAVA_URL_PRE;
    return Config.JAVA_URL;
  }


  static String getPhpUrl() {
    if (Config.DEVELOP)
      return Config.PHP_URL_DEV;
    if (Config.TEST)
      return Config.PHP_URL_TEST;
    if (Config.PRE)
      return Config.PHP_URL_PRE;
    return Config.PHP_URL;
  }

  static String getLoadingUrl() {
    if (Config.DEVELOP)
      return Config.DEV_UPLOAD;
    if (Config.TEST)
      return Config.TEST_UPLOAD;
    if (Config.PRE)
      return Config.UPLOAD_PRE;
    return Config.UPLOAD;
  }

  static HttpProvider instance;


  static final int CONNECT_TIMEOUT = 3000;

  static Dio _dio;
  static HttpProvider _httpProvider;

  HttpProvider._internal() {
    _dio = new Dio(BaseOptions(
      baseUrl: getPhpUrl(),
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: CONNECT_TIMEOUT,
      sendTimeout: CONNECT_TIMEOUT,
      // 5s
      contentType: Headers.jsonContentType,
      responseType: ResponseType.plain,
    ));

    if (Config.TEST || Config.DEVELOP)
      _dio.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志
    else
      _dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志

  }


  // 获取对象
  static HttpProvider init() {
    if (_httpProvider == null) {
      // 使用私有的构造方法来创建对象
      _httpProvider = HttpProvider._internal();
    }
    return _httpProvider;
  }

  static HttpProvider getInstance() => init();


  HttpProvider createPService() {
    _dio.options.baseUrl = getPhpUrl();
    return this;
  }

  HttpProvider createJService() {
    _dio.options.baseUrl = getJavaUrl();
    return this;
  }


  Future request(String url, String method,
      Params param, ReqCallBack callBack) async {
    // 配置dio请求信息
    try {
      Response response;
      if(!BaseUtils.isEmpty(Config.token)) {
        _dio.options.headers.addAll({"access-token": Config.token});
      }
      if (method == 'get') {
        response = await _dio.get(url, queryParameters: param.map);
      }
      else if (method == "post") {
        response = await _dio.post(url, data: param.map);
      }

      if (null != callBack)
        return _json(response, callBack, true);
      return response.data;
    }
    catch(e,s){
      if(null != callBack)
        callBack.onReqError(e,s);
      return false;
    }
  }

//  Future request(String url, String method,
//      Params param, ReqCallBack callBack) async {
//    // 配置dio请求信息
//      Response response;
//      if(!BaseUtils.isEmpty(Config.token)) {
//        _dio.options.headers.addAll({"access-token": Config.token});
//      }
//      if (method == 'get') {
//        response = await _dio.get(url, queryParameters: param.map);
//      }
//      else if (method == "post") {
//        response = await _dio.post(url, data: param.map);
//      }
//
////      if (null != callBack)
////        _json(response, callBack, true);
//      return response.data;
//  }


  ///回调的方式


  Future postP(String url, Params param, ReqCallBack callback) async {
    createPService();

    return request(url, 'post', param, callback);
  }

  Future getP(String url, Params param, ReqCallBack callback) async {
    createPService();

    return request(url, 'get', param, callback);
  }

  Future postJ(String url, Params param, ReqCallBack callback) async {
    createJService();

    return request(url, 'post', param, callback);
  }


  void zipPost(List<Future> list, List<ReqCallBack> callbacks) {
    Future.wait(list)
        .then((results) {
      for (var i = 0; i < callbacks.length; i++) {
        if (i == 0) {
          _json(results[0], callbacks[0], true);
        }
        else {
          _json(results[i], callbacks[i], false);
        }
      }
    }).catchError((onError) {
      if (null != callbacks[0])
        callbacks[0].onReqError(onError, null);
    });
  }


  bool _json(Response response, ReqCallBack callBack, bool isUse) {
//    try{
    var isSuc = false;
    if (response.statusCode != 200) {
//        _msg = response.statusCode.toString();
      //服务器错误提示
      if (null != callBack && isUse) {
        if (callBack.isToast)
          ToastUtil.showToast(response.statusMessage);
        callBack.onReqError(response.statusMessage, null);
      }
    }
    else {
      var result = response.data;
      var resCallbackMap = json.decode(result);
      int _code = resCallbackMap['code'];
      if (_code == 1) {
        isSuc = true;
        var result = resCallbackMap["data"];
        if (null != callBack)
          callBack.onReqSuccess(result);
      }
      else {
        String message = resCallbackMap["message"].toString();
        //逻辑业务处理提示
        if (callBack.isToast)
          ToastUtil.showToast(message);
        if (null != callBack && isUse)
          callBack.onReqFailed(_code);
      }
    }
    if (null != callBack && isUse)
      callBack.onReqCompleted();

    return isSuc;
  }
}