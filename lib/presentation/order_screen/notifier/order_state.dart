part of 'order_notifier.dart';

/// Represents the state of Order in the application.

// ignore_for_file: must_be_immutable
class OrderState extends Equatable {
  OrderState({
    this.emailSectionController,
    this.phoneNumberSectionController,
    this.startDateController,
    this.durationCtrl,
    this.orderModelObj,
    this.quantityController,
    this.addressCtrl,
    this.frequencyCtrl,
    required this.formKey,
    this.isLoading = false,
  });

  TextEditingController? emailSectionController;
  String? frequencyCtrl;
  bool? isLoading;

  TextEditingController? phoneNumberSectionController;

  TextEditingController? quantityController;

  DateTime? startDateController;

  TextEditingController? addressCtrl;

  TextEditingController? durationCtrl;
  GlobalKey<FormState> formKey;

  OrderModel? orderModelObj;

  @override
  List<Object?> get props => [
        emailSectionController,
        phoneNumberSectionController,
        startDateController,
        durationCtrl,
        quantityController,
        orderModelObj,
        frequencyCtrl,
        formKey,
        isLoading
      ];
  OrderState copyWith({
    TextEditingController? emailSectionController,
    TextEditingController? phoneNumberSectionController,
    TextEditingController? durationSectionController,
    TextEditingController? durationCtrl,
    TextEditingController? quantityController,
    DateTime? startDateController,
    TextEditingController? endDateController,
    OrderModel? orderModelObj,
    String? frequencyCtrl,
    GlobalKey<FormState>? formKey,
    bool? isLoading,
  }) {
    return OrderState(
      emailSectionController:
          emailSectionController ?? this.emailSectionController,
      phoneNumberSectionController:
          phoneNumberSectionController ?? this.phoneNumberSectionController,
      startDateController: startDateController ?? this.startDateController,
      durationCtrl: durationCtrl ?? this.durationCtrl,
      orderModelObj: orderModelObj ?? this.orderModelObj,
      quantityController: quantityController ?? this.quantityController,
      frequencyCtrl: frequencyCtrl ?? this.frequencyCtrl,
      formKey: formKey ?? this.formKey,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
