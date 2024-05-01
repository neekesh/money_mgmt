import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/urgent_delivery_page_one_container_model.dart';

part 'urgent_delivery_page_one_container_state.dart';

final urgentDeliveryPageOneContainerNotifier = StateNotifierProvider<
    UrgentDeliveryPageOneContainerNotifier,
    UrgentDeliveryPageOneContainerState>(
  (ref) => UrgentDeliveryPageOneContainerNotifier(
      UrgentDeliveryPageOneContainerState(
    urgentDeliveryPageOneContainerModelObj:
        UrgentDeliveryPageOneContainerModel(),
  )),
);

/// A notifier that manages the state of a UrgentDeliveryPageOneContainer according to the event that is dispatched to it.
class UrgentDeliveryPageOneContainerNotifier
    extends StateNotifier<UrgentDeliveryPageOneContainerState> {
  UrgentDeliveryPageOneContainerNotifier(
      UrgentDeliveryPageOneContainerState state)
      : super(state);
}
