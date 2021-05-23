import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainerState(this.url);
}
class _WebViewContainerState extends State<WebViewContainer> with WidgetsBindingObserver  {
  WebViewController _controller;
  var _url;
  final _key = UniqueKey();
  _WebViewContainerState(this._url);


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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(aspectRatio: 560/846,
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url,
                    onWebViewCreated:(controller) => _controller = controller,
        ),
    ),
          ],
        ));
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
  void deactivate() {
    super.deactivate();
    _controller?.reload();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _controller?.reload();
    }
    if (state == AppLifecycleState.resumed) {
    //  _controller?.reload();
    }
  }

}