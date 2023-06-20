import 'package:aurora_connect_one/presentation/commons/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../commons/utils.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  late SizeConfig configSize;

  @override
  Widget build(BuildContext context) {
    configSize = SizeConfig().init(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: screenSize.width,
            height: screenSize.height * 0.1,
            child: Card(
              elevation: 8,
              shadowColor: Colors.white30,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, bottom: 2.0, left: 24.0, right: 24.0),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 55.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            AppImages.back_arrow_icon,
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width,
                      child: const Center(
                        child: Text(
                          'Terms of use',
                          style: TextStyle(
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width,
            height: screenSize.height * 0.9,
            child: Center(
              child:  WebViewWidget(
                controller: _controller,
              )
            ),
          ),
        ],
      ),
    );
  }

  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // print the loading progress to the console
          // you can use this value to show a progress bar if you want
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse("https://www.kindacode.com"));
}
