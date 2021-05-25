import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';





class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;



  @override
  void initState() {
    super.initState();
    // _getToken();
    // _loadUserData();
  }

  String _url(){
    String url;
    if(Platform.isAndroid){
      url = "https://www.chamaripashoes.com/androidhome";
    }else if(Platform.isIOS){
      url = "https://www.chamaripashoes.com/ioshome";
    }else{
      url = "https://www.chamaripashoes.com";
    }return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff63779C),
        toolbarHeight: 0,
      ),
      body:
      Stack(
        children: [
          WebView(
            initialUrl: _url(),
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          ),

          buildLoading(),

        ],
      ),
    );
  }

  Widget buildLoading() {
    return Positioned(
      child: _isLoading
          ? Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff313131))),

            ],
          ),
        ),
        color: Colors.white.withOpacity(0.8),
      )
          : Container(),
    );
  }

}
