// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class ErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
  final VoidCallback onPressedCache;
  final bool cache;

  const ErrorWidget({
    @required this.errorMessage,
    @required this.onPressed,
    @required this.onPressedCache,
    @required this.cache,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(30),
          child: Icon(
            Icons.error_outline,
            color: Constants.primaryColor,
            size: 150,
          ),
        ),
        Text(
          'Ha ocurrido un error',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              errorMessage,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: GFButton(
            text: 'Intentar actualizar la información',
            textColor: Constants.primaryColor,
            color: Constants.primaryColor,
            size: GFSize.LARGE,
            shape: GFButtonShape.pills,
            type: GFButtonType.outline2x,
            fullWidthButton: true,
            onPressed: onPressed,
          ),
        ),
        cache
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: GFButton(
                  text: 'Ver última información obtenida',
                  textColor: Constants.primaryColor,
                  color: Constants.primaryColor,
                  size: GFSize.LARGE,
                  shape: GFButtonShape.pills,
                  type: GFButtonType.outline2x,
                  fullWidthButton: true,
                  onPressed: onPressedCache,
                ),
              )
            : Container(),
      ],
    );
  }
}
