

import 'dart:io';

import 'package:dio/dio.dart';

typedef ResponseCallback = void Function(bool result, Map map);


class DioUtils{
  static final String Base_url = "";//ZC_PHP_base_url;
  static DioUtils _instance;

  Dio _dio;
  BaseOptions _baseOptions;

  static DioUtils getInstance(){
    if (_instance == null){
      _instance = DioUtils();
    }
    return _instance;
  }

  /**
   * dio初始化配置
   */
  DioUtils(){
    _baseOptions = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );

    _dio = Dio(_baseOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions requestions) async{
        //此处可网络请求之前做相关配置，比如会所有请求添加token，或者userId
        // requestions.queryParameters["token"] = "testtoken123443423";
        // requestions.queryParameters["userId"] = "123456";
        print('-----请求参数--'+requestions.queryParameters.toString());
        return requestions;
      },onResponse: (Response response){
            return response;

        }, onError: (DioError error){
            return error;
          }),
    );
  }


  get(url,{data,options}) async{
    print('get request path ------${url}-------请求参数${data}');
    print('------------');
    Response response;
    try{
      response = await _dio.get(url,queryParameters: data,options: options);
    }on DioError catch (e){
      print('请求失败---错误类型${e.type}--错误信息${e.message}');
    }

    return response.data.toString();
  }

  post(url,{data,options,callback(bool,Map)}) async {
    print('post request path ------${url}-------请求参数${data}');
    Response response;
    try {
      response = await _dio.post(url,data: data);
      print(response);
      int statusCode = response.statusCode;
      if(statusCode == 200){
        var json_data = response.data["data"];
        var json_meta = response.data["meta"];
        int code = json_meta["code"];
        if (code == 200){
          int subCode = json_data["subCode"];
          if(subCode == 10000){
            var result = json_data["result"];
            callback(true,result);
          }else{
            String subMsg = json_data["subMsg"];
          }
        }else{
          String msg = json_meta["msg"];
        }

      }

    }on DioError catch(e){
      print('请求失败---错误类型${e.type}--错误信息${e.message}');
    }
  }
}