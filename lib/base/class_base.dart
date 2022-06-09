import 'package:flutter/material.dart';
import 'package:fruits_inventory/base/class_request.dart';

class ClassBase {
  final BuildContext _c;
  late ClassRequest _r;

  ClassBase(this._c){
    _r = ClassRequest(_c);
  }

  ClassRequest get r => _r;

  void openPage(Widget page){
    Navigator.of(_c).push(MaterialPageRoute(
        builder: (context) => page
    ));
  }

  void replacePage(Widget page){
    Navigator.of(_c).pushReplacement(MaterialPageRoute(
        builder: (context) => page
    ));
  }

  void goBack(){
    Navigator.of(_c).pop();
  }
}
