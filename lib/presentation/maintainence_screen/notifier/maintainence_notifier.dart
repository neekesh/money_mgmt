import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/maintainence_models.dart';

part 'maintainence_state.dart';

final maintenanceNotifier =
    StateNotifierProvider<MaintenanceNotifier, MaintenanceState>(
  (ref) => MaintenanceNotifier(MaintenanceState(
    emailEditTextController: TextEditingController(),
    addressEditTextController: TextEditingController(),
    phoneNumberEditTextController: TextEditingController(),
    maintenanceModelObj: MaintenanceModel(),
  )),
);

/// A notifier that manages the state of a Maintenance according to the event that is dispatched to it.
class MaintenanceNotifier extends StateNotifier<MaintenanceState> {
  MaintenanceNotifier(MaintenanceState state) : super(state);
}
