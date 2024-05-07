part of 'maintainence_notifier.dart';

/// Represents the state of Maintenance in the application.

// ignore_for_file: must_be_immutable
class MaintenanceState extends Equatable {
  MaintenanceState({
    this.emailEditTextController,
    this.addressEditTextController,
    this.phoneNumberEditTextController,
    this.maintenanceModelObj,
    this.dateEditCtrl,
    this.messageTextController,
  });

  TextEditingController? emailEditTextController;

  TextEditingController? addressEditTextController;
  TextEditingController? messageTextController;

  TextEditingController? phoneNumberEditTextController;
  TextEditingController? dateEditCtrl;

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
    TextEditingController? dateEditCtrl,
    TextEditingController? messageTextController,
  }) {
    return MaintenanceState(
      emailEditTextController:
          emailEditTextController ?? this.emailEditTextController,
      addressEditTextController:
          addressEditTextController ?? this.addressEditTextController,
      phoneNumberEditTextController:
          phoneNumberEditTextController ?? this.phoneNumberEditTextController,
      dateEditCtrl: dateEditCtrl,
      maintenanceModelObj: maintenanceModelObj ?? this.maintenanceModelObj,
      messageTextController:
          messageTextController ?? this.messageTextController,
    );
  }
}
