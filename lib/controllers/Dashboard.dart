import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_inventory/base/class_base.dart';
import 'package:fruits_inventory/globalwidget/dialogs.dart';
import 'package:fruits_inventory/variable/fruit.dart';
import 'package:fruits_inventory/views/dashboard/dashboard_view.dart';


class Dashboard extends StatefulWidget {
  static String tag = "dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late ClassBase b;

  List<Fruit> dataFruit = [];
  Fruit? selectedFruit;

  @override
  void initState() {
    super.initState();
    b = ClassBase(context);
    Future.delayed(Duration.zero, () {
      getFruits();
    });
  }

  getFruits() async {
    var response = await b.r.getFruits();

    dataFruit = [];
    response = response.containsKey("data") ? response["data"] : response;
    if(response.containsKey("fruits")){
      for(Map<String, dynamic> value in response["fruits"]){
        var idxFruit = getFruitData(value["name"]);
        if(idxFruit == -1){
          var ff = Fruit(value["name"]);
          ff.price.add(value["price"]);
          dataFruit.add(ff);
        }else{
          dataFruit[idxFruit].price.add(value["price"]);
        }
      }
    }
    if(response.containsKey("imagesReferences")){
      Map<String, dynamic> images = response["imagesReferences"];
      for (var element in images.keys) {
        var idxFruit = getFruitData(element);
        if(idxFruit > -1){
          dataFruit[idxFruit].imageReference = images[element];
        }
      }
    }
    setState((){});
  }

  int getFruitData(String name){
    for(var i = 0; i < dataFruit.length; i++){
      if(dataFruit[i].name == name) { return i;}
    }
    return -1;
  }

  showMostFruit(){
    if(dataFruit.isEmpty){
      return;
    }
    var mostFruit = dataFruit[0];
    for(var i = 0; i < dataFruit.length; i++){
      if(dataFruit[i].price.length > mostFruit.price.length) {
        mostFruit = dataFruit[i];
      }
    }
    Dialogs.showGlobalDialog(context, "Alert",
        "${mostFruit.name} total is ${mostFruit.price.length}",
        false, () => b.goBack());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardView(this);
  }
}
