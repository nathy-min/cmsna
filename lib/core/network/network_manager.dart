import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmsna/core/network/utils/constants.dart';
import 'package:dio/dio.dart';

Duration timoutDuration = const Duration(seconds: 30);

class NetworkManager {
  // static LocalDataSource localDataSource = LocalDataSourceImpl();

  static Dio createDio() {
    BaseOptions opts = BaseOptions(
      baseUrl: base_url,
      responseType: ResponseType.json,
      connectTimeout: timoutDuration,
      receiveTimeout: timoutDuration,
    );

    return Dio(opts);
  }

  static Dio createFormDio() {
    BaseOptions opts = BaseOptions(
      baseUrl: base_url,
      contentType: 'multipart/form-data',
      responseType: ResponseType.json,
      connectTimeout: timoutDuration,
      receiveTimeout: timoutDuration,
    );

    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.addAll([
        InterceptorsWrapper(onRequest: (options, handler) async {
          // String? token = await localDataSource.getAccessToken();
          // if (token != "") {
          //   options.headers.addAll({"Authorization": "Bearer $token"});
          // }
          return handler.next(options);
        }, onResponse: (response, handler) async {
          return handler.next(response);
        }, onError: (DioException e, handler) async {
          int retryCount = 1;
          if (e.response?.statusCode == 401 && retryCount > 0) {
            // String? refToken = await localDataSource.getRefreshToken();
            // Response tokenResp = await tokenDio
            //     .post("/refresh", data: {"refreshToken": refToken});
            // switch (tokenResp.statusCode) {
            //   case 200:
            //     var token = tokenResp.data["accessToken"];
            //     var refreshToken = tokenResp.data["refreshToken"];
            //     localDataSource.persistField(ACCESS_TOKEN_KEY, token);
            //     localDataSource.persistField(REFRESH_TOKEN_KEY, refreshToken);
            //     localDataSource.setRetryCount(1);
            //     break;
            //   default:
            //     return handler.next(e);
            // }

            final options = Options(
              method: e.requestOptions.method,
              headers: e.requestOptions.headers,
            );
            var req = dio.request<dynamic>(e.requestOptions.path,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters,
                options: options);

            return handler.resolve(await req);
          } else if (e.response?.statusCode == 404 ||
              e.response?.statusCode == 400) {
            return handler.next(e);
          } else if (e.response?.statusCode == 401) {
            // localDataSource.deleteToken();
          }
          return handler.next(e);
        }),
      ]);
  }

  static Dio tokenDio = createDio();
  static Dio dio = createDio();
  static Dio fileDio = createDio();

  static final baseAPI = addInterceptors(dio);

  Future<Response> get(String url) async {
    try {
      Response response = await baseAPI.get(url);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> post(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> put(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> patchFile(String url, dynamic data) async {
    try {
      Dio api = addInterceptors(fileDio);
      Response response = await api.patch(url, data: data);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> delete(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> head(String url) async {
    try {
      Response response = await baseAPI.head(url);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  toJson(data) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(data);
    log(prettyprint);
  }
}
