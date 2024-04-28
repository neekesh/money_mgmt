import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/maintainence_one_models.dart';

part 'maintenance_one_state.dart';

final maintenanceOneNotifier =
    StateNotifierProvider<MaintenanceOneNotifier, MaintenanceOneState>(
  (ref) => MaintenanceOneNotifier(MaintenanceOneState(
    maintenanceOneModelObj: MaintenanceOneModel(),
  )),
);

/// A notifier that manages the state of a MaintenanceOne according to the event that is dispatched to it.
class MaintenanceOneNotifier extends StateNotifier<MaintenanceOneState> {
  MaintenanceOneNotifier(MaintenanceOneState state) : super(state);
}
