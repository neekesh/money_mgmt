import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/dashboard_model.dart';
import '../models/gridordertext_item_model.dart';
part 'dashboard_state.dart';

final dashboardNotifier =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
  (ref) => DashboardNotifier(DashboardState(
    dashboardModelObj: DashboardModel(gridordertextItemList: [
      GridordertextItemModel(
          orderImage: ImageConstant.imgFlowerDelivery, orderText: "Order"),
      GridordertextItemModel(
          orderImage: ImageConstant.imgDeliverFood,
          orderText: "Urgent Delivery"),
      GridordertextItemModel(
          orderImage: ImageConstant.imgInvoice, orderText: "Invoices"),
      GridordertextItemModel(
          orderImage: ImageConstant.imgWrench, orderText: "Maintenance")
    ]),
  )),
);

/// A notifier that manages the state of a Dashboard according to the event that is dispatched to it.
class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier(DashboardState state) : super(state);
}
