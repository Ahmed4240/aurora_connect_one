import 'package:flutter/material.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  var loadingPercentage = 0;
  final _key = UniqueKey();
  final String _url = 'https://www.hostinger.com/tutorials/what-is-a-url';

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
          children: [
            Card(
              elevation: 8,
              shadowColor: Colors.white30,
              child: Container(
                color: AppColors.whiteColor,
                width: screenSize.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 44.0, left: 18.0, right: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: moveBack(context),
                          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
                      const Text(
                        "Terms of use",
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Metropolis'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.backGroundColor,
                            borderRadius: BorderRadius.circular(80.0)),
                        child: Image.asset(
                          AppImages.femaleDoctor1,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  moveBack(BuildContext context) {
    Navigator.pop(context);
  }
}
