import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/order_page_two_model.dart';

part 'order_page_two_state.dart';

final orderPageTwoNotifier =
    StateNotifierProvider<OrderPageTwoNotifier, OrderPageTwoState>(
  (ref) => OrderPageTwoNotifier(OrderPageTwoState(
    orderPageTwoModelObj: OrderPageTwoModel(),
  )),
);

/// A notifier that manages the state of a OrderPageTwo according to the event that is dispatched to it.
class OrderPageTwoNotifier extends StateNotifier<OrderPageTwoState> {
  OrderPageTwoNotifier(OrderPageTwoState state) : super(state);
}
