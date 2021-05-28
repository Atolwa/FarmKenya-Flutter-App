import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;
  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer>
    with WidgetsBindingObserver {
  WebViewController _controller;
  final _key = UniqueKey();
  bool isScreenVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Padding(
        //padding: const EdgeInsets.all(8.0),
        //child: Image.asset('assets/logo/fklogo.png',
        //height: 100,),
        //),
        title: Text(
          "FarmKenya",
          style: TextStyle(
              fontFamily: 'Periodico',
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: isScreenVisible
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 560 / 846,
                  child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: widget.url,
                    onWebViewCreated: (controller) => _controller = controller,
                  ),
                ),
              ],
            )
          : Container(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      setState(() {
        isScreenVisible = false;
      });
    }
    if (state == AppLifecycleState.resumed) {
      _controller?.reload();
      setState(() {
        isScreenVisible = true;
      });
    }
  }
}
