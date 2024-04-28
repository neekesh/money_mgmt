import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/appointment_one_models.dart';
part 'appointment_one_state.dart';

final appointmentOneNotifier =
    StateNotifierProvider<AppointmentOneNotifier, AppointmentOneState>(
  (ref) => AppointmentOneNotifier(AppointmentOneState(
    appointmentOneModelObj: AppointmentOneModel(),
  )),
);

/// A notifier that manages the state of a AppointmentOne according to the event that is dispatched to it.
class AppointmentOneNotifier extends StateNotifier<AppointmentOneState> {
  AppointmentOneNotifier(AppointmentOneState state) : super(state);
}
