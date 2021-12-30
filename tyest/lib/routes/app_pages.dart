import 'package:get/get.dart';
import 'package:tyest/page/home/bindding/home_bindding.dart';
import 'package:tyest/page/home/controller/home_controller.dart';
import 'package:tyest/page/home/view/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () =>  HomeView(),
        binding: HomeBinding()),
  ];
}
