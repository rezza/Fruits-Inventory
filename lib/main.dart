import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_inventory/base/class_global_var.dart';
import 'package:fruits_inventory/configs/color_utils.dart';
import 'package:fruits_inventory/controllers/Dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primary,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return StatefulWrapper(
        onInit: () {},
        navigatorKey: navigatorKey,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ClassGlobalVar.appName,
          home: const Dashboard(),
          locale: const Locale("id-ID"),
          navigatorKey: navigatorKey,
        ));
  }
}

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;
  const StatefulWrapper({required this.onInit, required this.child, required this.navigatorKey});

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> with WidgetsBindingObserver  {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
