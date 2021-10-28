import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class AppView extends StatefulWidget {
  @override
  AppViewState createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: WebView(
              initialUrl: "https://pos.ultimatefosters.com/login",
              javascriptMode: JavascriptMode.unrestricted,

              // javascriptChannels: Set.from([
              //   JavascriptChannel(
              //       name: 'print',
              // onMessageReceived: (JavascriptMessage message) {
              //   //This is where you receive message from
              //   //javascript code and handle in Flutter/Dart
              //   //like here, the message is just being printed
              //   //in Run/LogCat window of android studio
              //   print("Our message: " + message.message);
              //   if (message.message == "Payment: false") {
              //     print("PAYMENT IS FAILED ===> FALSE");
              //     _onBackPressed();
              //   } else {
              //     var orderId = message.message.split(',').first;
              //     var deliveryDate = message.message.split(',').last;
              //     print("ORDERID DATE=============>: " + orderId);
              //     //TODO: here i have to parse the order id from the jas channel
              //     Get.to(() => OrderConfirmationScreen(
              //         widget.cart, orderId, deliveryDate));
              //   }
              // })
              // ]),
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///on[ backpressed] call back to avoid user interaction with splash screen
  ///
  Future<bool> _onBackPressed() async {
    return AlertDialog(
          title: Text("'Are you sure?'"),
          content: new Text('Do you want to quit App'),
          actions: <Widget>[
            new FlatButton(
              textColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pop(false);
                // _updateConnectionFlag(true);
              },
              child: Text(
                "NO",
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 16),
            new FlatButton(
              textColor: Colors.blue,
              onPressed: () {
                // Get.offAll(RootScreen(index: 0));
                exit(0);
              },
              child: Text(
                "YES",
                style: TextStyle(),
              ),
            ),
          ],
        ) ??
        false;
  }
}
