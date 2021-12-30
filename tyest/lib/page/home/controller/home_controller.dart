import 'dart:convert';

import 'package:get/get.dart';
import 'package:tyest/model/link_model.dart';
import 'package:tyest/repositories/api_client.dart';

class HomeController extends GetxController {
  final ApiClient client;

  HomeController({required this.client});

  final loading = false.obs;
  final listLink = <LinkModel>[].obs;

  @override
  void onInit() {
    fetchAll();
    super.onInit();
  }

  fetchAll() async {
    await client.getLink(keyword: 1).then((response) async {
      print(response.data);
      listLink.assignAll((jsonDecode(response.data) as List)
          .map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
          .toList());
      print("=========");
      print(listLink);
    }).catchError((error, trace) {
      printError();
    });
  }
}
