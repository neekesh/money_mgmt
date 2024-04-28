part of 'appointment_notifier.dart';

/// Represents the state of Appointment in the application.

// ignore_for_file: must_be_immutable
class AppointmentState extends Equatable {
  AppointmentState(
      {this.emailController,
      this.phoneNumberController,
      this.appointmentModelObj});

  TextEditingController? emailController;

  TextEditingController? phoneNumberController;

  AppointmentModel? appointmentModelObj;

  @override
  List<Object?> get props =>
      [emailController, phoneNumberController, appointmentModelObj];
  AppointmentState copyWith({
    TextEditingController? emailController,
    TextEditingController? phoneNumberController,
    AppointmentModel? appointmentModelObj,
  }) {
    return AppointmentState(
      emailController: emailController ?? this.emailController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      appointmentModelObj: appointmentModelObj ?? this.appointmentModelObj,
    );
  }
}
