part of 'appointment_one_notifier.dart';

/// Represents the state of AppointmentOne in the application.

// ignore_for_file: must_be_immutable
class AppointmentOneState extends Equatable {
  AppointmentOneState({this.appointmentOneModelObj});

  AppointmentOneModel? appointmentOneModelObj;

  @override
  List<Object?> get props => [appointmentOneModelObj];
  AppointmentOneState copyWith({AppointmentOneModel? appointmentOneModelObj}) {
    return AppointmentOneState(
      appointmentOneModelObj:
          appointmentOneModelObj ?? this.appointmentOneModelObj,
    );
  }
}
