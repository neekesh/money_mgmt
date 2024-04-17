import '../../../core/app_export.dart';

/// This class is used in the [gridordertext_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class GridordertextItemModel {
  GridordertextItemModel({this.orderImage, this.orderText, this.id}) {
    orderImage = orderImage ?? ImageConstant.imgFlowerDelivery;
    orderText = orderText ?? "Order";
    id = id ?? "";
  }

  String? orderImage;

  String? orderText;

  String? id;
}
