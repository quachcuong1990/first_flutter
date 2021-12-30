import 'package:dio/dio.dart';
import 'package:tyest/repositories/base_client.dart';

class ApiClient extends BaseClient {
  final client = BaseClient.instance.dio;

  Future<Response> getLink({required int keyword}) async {
    FormData formData = FormData.fromMap({"id": keyword});
    return BaseClient.instance.dio
        .post('$authServiceBaseUrl/get_link.php', data: formData);
  }
}
