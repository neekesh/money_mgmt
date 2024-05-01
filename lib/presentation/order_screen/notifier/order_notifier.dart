import '../models/order_model.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

final orderNotifier = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(OrderState(
    emailSectionController: TextEditingController(),
    phoneNumberSectionController: TextEditingController(),
    durationSectionController: TextEditingController(),
    dateController: TextEditingController(),
    intervalsSectionController: TextEditingController(),
    orderModelObj: OrderModel(),
  )),
);

/// A notifier that manages the state of a Order according to the event that is dispatched to it.
class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier(OrderState state) : super(state);
}
