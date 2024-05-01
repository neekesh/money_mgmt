import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/urgent_delivery_page_one_page_model.dart';
part 'urgent_delivery_page_one_page_state.dart';

final urgentDeliveryPageOneNotifier = StateNotifierProvider<
    UrgentDeliveryPageOneNotifier, UrgentDeliveryPageOneState>(
  (ref) => UrgentDeliveryPageOneNotifier(UrgentDeliveryPageOneState(
    emailController: TextEditingController(),
    urgentDeliveryPageOneModelObj: UrgentDeliveryPageOneModel(),
  )),
);

/// A notifier that manages the state of a UrgentDeliveryPageOne according to the event that is dispatched to it.
class UrgentDeliveryPageOneNotifier
    extends StateNotifier<UrgentDeliveryPageOneState> {
  UrgentDeliveryPageOneNotifier(UrgentDeliveryPageOneState state)
      : super(state);
}
