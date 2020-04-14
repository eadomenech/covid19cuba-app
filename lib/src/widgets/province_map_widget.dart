import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class ProvinceWebViewKeepAlive extends StatefulWidget {
  final Map<String, dynamic> mapData;
  final String provinceCode;

  ProvinceWebViewKeepAlive({this.mapData, this.provinceCode})
      : assert(mapData != null, provinceCode != null);

  @override
  ProvinceWebViewKeepAliveState createState() =>
      ProvinceWebViewKeepAliveState();
}

class ProvinceWebViewKeepAliveState extends State<ProvinceWebViewKeepAlive>
    with AutomaticKeepAliveClientMixin {
  WebView webView;
  WebViewController controller;
  String mapData = "{}";
  String code = "";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    webView = WebView(
      initialUrl: 'assets/map2.html',
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (_) {
        mapData = jsonEncode(widget.mapData);
        code = widget.provinceCode;
        controller
            .evaluateJavascript('covidData3($mapData,\"$code\")')
            .whenComplete(() {});
      },
      gestureRecognizers: Set()
        ..add(
          Factory<PanGestureRecognizer>(
            () => PanGestureRecognizer(),
          ),
        )
        ..add(
          Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer(),
          ),
        )
        ..add(
          Factory<HorizontalDragGestureRecognizer>(
            () => HorizontalDragGestureRecognizer(),
          ),
        )
        ..add(
          Factory<ScaleGestureRecognizer>(
            () => ScaleGestureRecognizer(),
          ),
        ),
      onWebViewCreated: (WebViewController webViewController) {
        controller = webViewController;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    webView = null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 250,
      margin: EdgeInsets.only(left: 0, right: 0, top: 0),
      child: webView,
    );
  }
}

class ProvinceMapWebViewWidget extends StatefulWidget {
  final Map<String, dynamic> mapData;
  final String provinceCode;

  ProvinceMapWebViewWidget({this.mapData, this.provinceCode})
      : assert(mapData != null, provinceCode != null);

  @override
  ProvinceMapWebViewWidgetState createState() =>
      ProvinceMapWebViewWidgetState();
}

class ProvinceMapWebViewWidgetState extends State<ProvinceMapWebViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Distribución por Municipios',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        ProvinceWebViewKeepAlive(
          mapData: widget.mapData,
          provinceCode: widget.provinceCode,
        ),
      ],
    );
  }
}