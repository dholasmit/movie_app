import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response?> getApi({
    required String url,
    required Map<String, String> header,
  }) async {
    try {
      if (kDebugMode) {
        print("Url => $url");
        print("Header => $header");
      }
      return http.get(
        Uri.parse(url),
        headers: header,
      );
    } catch (e) {
      flutterToast(e.toString());
      return null;
    }
  }

  static Future<http.Response?> postApi({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      if (kDebugMode) {
        print("Url => $url");
        print("Header => $header");
        print("Body => $body");
      }
      return http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
    } catch (e) {
      flutterToast(e.toString());
      return null;
    }
  }
}

flutterToast(String msg) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
    msg: msg,
    textColor: Colors.white,
    backgroundColor: Colors.black.withOpacity(0.70),
    fontSize: 14,
  );
}
