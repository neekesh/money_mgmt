import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/urgent_delivery_page_two_model.dart';

part 'urgent_delivery_page_two_state.dart';

final urgentDeliveryPageTwoNotifier = StateNotifierProvider<
    UrgentDeliveryPageTwoNotifier, UrgentDeliveryPageTwoState>(
  (ref) => UrgentDeliveryPageTwoNotifier(UrgentDeliveryPageTwoState(
    urgentDeliveryPageTwoModelObj: UrgentDeliveryPageTwoModel(),
  )),
);

/// A notifier that manages the state of a UrgentDeliveryPageTwo according to the event that is dispatched to it.
class UrgentDeliveryPageTwoNotifier
    extends StateNotifier<UrgentDeliveryPageTwoState> {
  UrgentDeliveryPageTwoNotifier(UrgentDeliveryPageTwoState state)
      : super(state);
}
