part of 'maintainence_notifier.dart';

/// Represents the state of Maintenance in the application.

// ignore_for_file: must_be_immutable
class MaintenanceState extends Equatable {
  MaintenanceState({
    this.emailEditTextController,
    this.addressEditTextController,
    this.phoneNumberEditTextController,
    this.maintenanceModelObj,
    this.dateCtrl,
    this.messageTextController,
    required this.formKey,
  });

  TextEditingController? emailEditTextController;

  TextEditingController? addressEditTextController;
  TextEditingController? messageTextController;
  TextEditingController? phoneNumberEditTextController;
  DateTime? dateCtrl;
  GlobalKey<FormState> formKey;
  MaintenanceModel? maintenanceModelObj;

  @override
  List<Object?> get props => [
        emailEditTextController,
        addressEditTextController,
        phoneNumberEditTextController,
        messageTextController,
        maintenanceModelObj,
        formKey,
      ];
  MaintenanceState copyWith({
    TextEditingController? emailEditTextController,
    TextEditingController? addressEditTextController,
    TextEditingController? phoneNumberEditTextController,
    MaintenanceModel? maintenanceModelObj,
    TextEditingController? dateEditCtrl,
    TextEditingController? messageTextController,
    GlobalKey<FormState>? formKey,
  }) {
    return MaintenanceState(
      emailEditTextController:
          emailEditTextController ?? this.emailEditTextController,
      addressEditTextController:
          addressEditTextController ?? this.addressEditTextController,
      phoneNumberEditTextController:
          phoneNumberEditTextController ?? this.phoneNumberEditTextController,
      dateCtrl: dateCtrl ?? this.dateCtrl,
      maintenanceModelObj: maintenanceModelObj ?? this.maintenanceModelObj,
      messageTextController:
          messageTextController ?? this.messageTextController,
      formKey: formKey ?? this.formKey,
    );
  }
}
