import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/dashboard_model.dart';
import '../models/gridordertext_item_model.dart';
part 'dashboard_state.dart';

final dashboardNotifier =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
  (ref) => DashboardNotifier(DashboardState(
    dashboardModelObj: DashboardModel(
      gridordertextItemList: [
        GridordertextItemModel(
          orderImage: ImageConstant.imgFlowerDelivery,
          orderText: "Order",
          color: Color(0xFF4B984D),
        ),
        GridordertextItemModel(
          orderImage: ImageConstant.imgDeliverFood,
          orderText: "Urgent Delivery",
          color: Color(0xFF63681B),
        ),
        GridordertextItemModel(
          orderImage: ImageConstant.imgInvoice,
          orderText: "Invoices",
          color: Color(0xFF0F5323),
        ),
        GridordertextItemModel(
          orderImage: ImageConstant.imgWrench,
          orderText: "Repair",
          color: Color(0xFFC9C55E),
        ),
      ],
      isNotificationEnabled: true,
    ),
  )),
);

/// A notifier that manages the state of a Dashboard according to the event that is dispatched to it.
class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier(DashboardState state) : super(state);
  void handleNotificationState() {
    state = state.copyWith(
      dashboardModelObj: state.dashboardModelObj?.copyWith(
        isNotificationEnabled: (false),
      ),
    );
  }
}
