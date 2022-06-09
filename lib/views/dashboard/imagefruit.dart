import 'package:flutter/material.dart';
import 'package:fruits_inventory/configs/color_utils.dart';
import 'package:fruits_inventory/configs/size_utils.dart';
import 'package:fruits_inventory/controllers/Dashboard.dart';
import 'package:fruits_inventory/globalwidget/WidgetView.dart';

class ImageFruitView extends WidgetView<Dashboard, DashboardState> {
  const ImageFruitView(DashboardState state, {Key? key}): super(state, key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
          color: darkSecondaryText,
          borderRadius: BorderRadius.all(Radius.circular(kRadiusLg))
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(kRadiusLg)),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(state.selectedFruit != null ? state.selectedFruit!.imageReference : "",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/icons/fruitlogo.png");
                  },
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center( child: CircularProgressIndicator());
                  },
                )
              ),
              state.selectedFruit != null ?
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(margin4Xs),
                  color: searchField,
                  child: Text(
                    state.selectedFruit!.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                )) : Container()
            ],
          )
      ),
    );
  }
}
