import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruits_inventory/base/class_global_var.dart';
import 'package:fruits_inventory/base/class_utils.dart';
import 'package:fruits_inventory/globalwidget/dialogs.dart';
import 'package:http/http.dart' as http;

class ClassRequest {
  BuildContext c;

  ClassRequest(this.c);

  Future<Map<String, dynamic>> getFruits() async {
    Map<String, dynamic> param = {
      "data" : {
        "imageReferences" : true,
        "referenceId" : "1650165235"
      }
    };
    var response = await reqServer(param, ClassGlobalVar.getfruits, false, true, true);
    return response;
  }

  Future<Map<String, dynamic>> reqServer(Map<String, dynamic> param,
      String subUrl, bool useToken, bool usePost, bool useProgress) async {

    printLog("url ${ClassGlobalVar.mailUrl + subUrl}");
    printLog("url param : $param");

    if (useProgress) Dialogs.showProgressDialog(c);

    final response = usePost
        ? await http.post(
            Uri.parse(ClassGlobalVar.mailUrl + subUrl),
            body: json.encode(param),
          )
        : await http.get(
            Uri.parse(ClassGlobalVar.mailUrl + subUrl),
          );

    printLog("url $response");
    printLog("url ${response.body}");

    if (useProgress){
      Navigator.pop(c);
    }

    try {
      var resp = jsonDecode(response.body);

      if (resp["code"] == 200) {
        return resp;
      } else {
        return resp;
      }
    } on Exception catch (exception) {
      return {"error": "error parsing server response ${exception.toString()}"};
    }
  }
}
