import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fruits_inventory/base/class_auth.dart';
import 'package:fruits_inventory/base/class_global_var.dart';
import 'package:fruits_inventory/configs/size_utils.dart';
import 'package:fruits_inventory/controllers/Dashboard.dart';
import 'package:fruits_inventory/globalwidget/WidgetView.dart';
import 'package:fruits_inventory/views/dashboard/imagefruit.dart';
import 'package:fruits_inventory/views/dashboard/listfruit.dart';

class DashboardView extends WidgetView<Dashboard, DashboardState> {
  const DashboardView(DashboardState state, {Key? key}): super(state, key:key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: marginMd),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: marginLg),
                const SizedBox(width: double.infinity,
                  child: Text("Fruits Data",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: fontL)
                  ),
                ),
                const SizedBox(height: marginXs),
                Expanded(
                  flex: 1,
                  child: ListFruitView(state),
                ),
                const SizedBox(height: marginLg),
                ImageFruitView(state),
                const SizedBox(height: marginLg),
                SizedBox(width: 200, child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                    ),
                    onPressed: () {
                      state.showMostFruit();
                    },
                    child: const Text('Normal')
                )),
                const SizedBox(height: marginLg),
                SizedBox(width: 200, child: SignInButton(
                  Buttons.Google,
                  text: ClassGlobalVar.userLogin == null ? "Sign up with Google" : "Hello ${ClassGlobalVar.userLogin?.displayName}",
                  onPressed: () {
                    if(ClassGlobalVar.userLogin == null){
                      ClassAuth.signInWithGoogle(state);
                    }else{
                      ClassAuth.signOut(state);
                    }
                  },
                )),
                const SizedBox(height: marginLg),
              ]
          )
        )
      )
    );
  }
}
