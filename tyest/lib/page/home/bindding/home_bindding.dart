import 'package:get/get.dart';
import 'package:tyest/page/home/controller/home_controller.dart';
import 'package:tyest/repositories/api_client.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies≈Get
    Get.lazyPut(() => HomeController(client: ApiClient()));
  }
}
