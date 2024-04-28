import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:money_mgmt/core/app_export.dart';
import 'package:money_mgmt/presentation/appointment_screen/models/appointment_models.dart';
part 'appointment_state.dart';

final appointmentNotifier =
    StateNotifierProvider<AppointmentNotifier, AppointmentState>(
  (ref) => AppointmentNotifier(AppointmentState(
    emailController: TextEditingController(),
    phoneNumberController: TextEditingController(),
    appointmentModelObj: AppointmentModel(),
  )),
);

/// A notifier that manages the state of a Appointment according to the event that is dispatched to it.
class AppointmentNotifier extends StateNotifier<AppointmentState> {
  AppointmentNotifier(AppointmentState state) : super(state);
}
