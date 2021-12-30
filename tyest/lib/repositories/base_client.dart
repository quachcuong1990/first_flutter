import 'package:dio/dio.dart';

class BaseClient {
  static const _apiHostReal = 'https://ku8989.net';
  static const _apiLookup = 'https://www.iplocate.io/api/lookup';

  static const _authServiceBaseUrl = '/api';
  static BaseClient? _instance;
  Dio? _dio;

  BaseClient();

  static get instance {
    if (_instance == null) {
      _instance = BaseClient._internal();
    }
    return _instance;
  }

  get apiLookup => _apiLookup;

  get apiHostReal => _apiHostReal;

  get authServiceBaseUrl => _apiHostReal + _authServiceBaseUrl;

  // get orderServiceBaseUrl =>
  //     _apiHostReal +
  //     (mode == ACCOUNT_MODE_VIRTUAL
  //         ? _virtualOrderServiceBaseUrl
  //         : _orderServiceBaseUrl);
  //
  // get walletServiceBaseUrl =>
  //     _apiHostReal +
  //     (mode == ACCOUNT_MODE_VIRTUAL
  //         ? _virtualWalletServiceBaseUrl
  //         : _walletServiceBaseUrl);

  get dio => _dio;

  BaseClient._internal() {
    _dio = Dio();
    _dio!.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      print('Call api: ${options.path}');
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onResponse: (response, handler) {
      // print(response.toString());
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onError: (DioError e, handler) {
      // print(e.toString());
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    }));
  }
}
