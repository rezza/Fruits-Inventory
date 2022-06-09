import 'package:flutter/material.dart';
import 'package:fruits_inventory/configs/color_utils.dart';
import 'package:fruits_inventory/configs/size_utils.dart';
import 'package:fruits_inventory/controllers/Dashboard.dart';
import 'package:fruits_inventory/globalwidget/WidgetView.dart';
import 'package:intl/intl.dart';

class ListFruitView extends WidgetView<Dashboard, DashboardState> {
  ListFruitView(DashboardState state, {Key? key}): super(state, key:key);

  final oCcy = NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: primary,
      radius: const Radius.circular(kRadiusXL),
      thickness: 5,
      thumbVisibility: true,
      child:ListView.separated(
        separatorBuilder: (BuildContext context, int position) => const Divider(
          thickness: 0.5,
        ),
        itemCount: state.dataFruit.length,
        itemBuilder: (BuildContext context, int index) =>  InkWell(
          onTap: (){
            state.setState(() {
              state.selectedFruit = state.dataFruit[index];
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: margin3Xs, horizontal: margin3Xs),
            child: Row(
              children: [
                Expanded( flex: 1,
                  child: Text(state.dataFruit.isNotEmpty ? state.dataFruit[index].name : "-"),
                ),
                Text("total Rp ${oCcy.format(state.dataFruit.isNotEmpty ? state.dataFruit[index].getTotalPrice() : 0)}"),
                const SizedBox(width: margin3Xs)
              ],
            ),
          ),
        )
      )
    );
  }
}
