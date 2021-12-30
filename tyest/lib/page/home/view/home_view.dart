
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tyest/model/link_model.dart';
import 'package:tyest/page/home/controller/home_controller.dart';
import 'package:tyest/page/home/view/web_view_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:change_app_package_name/change_app_package_name.dart';
class HomeView extends GetView<HomeController> {
  // String url = "https://www.google.com.vn/";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            child: Center(
                child: Column(
                  children: [
                    Obx(
                          () => Column(
                        children: controller.listLink
                            .map((element) => buildButton(context, element))
                            .toList(),
                      ),
                    )
                  ],
                ))));
  }



  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }

  Widget buildButton(BuildContext context, LinkModel linkModel) {
    return Container(
      child: Column(
        children: [
          Image.asset('images/kubet.jpg',
          height: 220,
          width: 220,),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed: () async {
                final urlHome = linkModel.Linkhome;
                if(!await canLaunch(urlHome) ){
                  await launch(
                    urlHome,
                    forceSafariVC: true,
                    forceWebView: true,
                    enableJavaScript: true
                  );
                }
                _handleURLButtonPress(context, urlHome);

              },
                child: Text("Trang chủ"),
                style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed: (){
                _handleURLButtonPress(context, linkModel.Linkhelp);

              },
                child: Text("Hỗ trợ 24/7"),
                style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed: (){
                _handleURLButtonPress(context, linkModel.Linkpolicy);

              },
                child: Text("Chính sách ứng dụng"),
                style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed: ()async{
                final urlZalo = linkModel.Linkzalo;
                openBrowerUrl(url: urlZalo, inApp: false);
                _handleURLButtonPress(context, urlZalo);
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }

              },
                child: Text("Chat Zalo"),
                style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed: (){
                _handleURLButtonPress(context, linkModel.Linkemail);

              },
                child: Text("Tawk "),
                style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),

            ),
          ),




        ],
      )
    );
  }
  Future openBrowerUrl({
  required String url,
  bool inApp = false,
}) async{
    if(await canLaunch(url)){
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }
}
