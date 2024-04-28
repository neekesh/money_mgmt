part of 'maintainence_notifier.dart';

/// Represents the state of Maintenance in the application.

// ignore_for_file: must_be_immutable
class MaintenanceState extends Equatable {
  MaintenanceState(
      {this.emailEditTextController,
      this.addressEditTextController,
      this.phoneNumberEditTextController,
      this.maintenanceModelObj});

  TextEditingController? emailEditTextController;

  TextEditingController? addressEditTextController;

  TextEditingController? phoneNumberEditTextController;

  MaintenanceModel? maintenanceModelObj;

  @override
  List<Object?> get props => [
        emailEditTextController,
        addressEditTextController,
        phoneNumberEditTextController,
        maintenanceModelObj
      ];
  MaintenanceState copyWith({
    TextEditingController? emailEditTextController,
    TextEditingController? addressEditTextController,
    TextEditingController? phoneNumberEditTextController,
    MaintenanceModel? maintenanceModelObj,
  }) {
    return MaintenanceState(
      emailEditTextController:
          emailEditTextController ?? this.emailEditTextController,
      addressEditTextController:
          addressEditTextController ?? this.addressEditTextController,
      phoneNumberEditTextController:
          phoneNumberEditTextController ?? this.phoneNumberEditTextController,
      maintenanceModelObj: maintenanceModelObj ?? this.maintenanceModelObj,
    );
  }
}
