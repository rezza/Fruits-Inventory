import 'package:flutter/foundation.dart';

printLog(dynamic message){
  if (kDebugMode) {
    print(message);
  }
}