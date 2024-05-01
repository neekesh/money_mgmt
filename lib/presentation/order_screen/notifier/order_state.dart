part of 'order_notifier.dart';

/// Represents the state of Order in the application.

// ignore_for_file: must_be_immutable
class OrderState extends Equatable {
  OrderState(
      {this.emailSectionController,
      this.phoneNumberSectionController,
      this.durationSectionController,
      this.dateController,
      this.intervalsSectionController,
      this.orderModelObj});

  TextEditingController? emailSectionController;

  TextEditingController? phoneNumberSectionController;

  TextEditingController? durationSectionController;

  TextEditingController? dateController;

  TextEditingController? intervalsSectionController;

  OrderModel? orderModelObj;

  @override
  List<Object?> get props => [
        emailSectionController,
        phoneNumberSectionController,
        durationSectionController,
        dateController,
        intervalsSectionController,
        orderModelObj
      ];
  OrderState copyWith({
    TextEditingController? emailSectionController,
    TextEditingController? phoneNumberSectionController,
    TextEditingController? durationSectionController,
    TextEditingController? dateController,
    TextEditingController? intervalsSectionController,
    OrderModel? orderModelObj,
  }) {
    return OrderState(
      emailSectionController:
          emailSectionController ?? this.emailSectionController,
      phoneNumberSectionController:
          phoneNumberSectionController ?? this.phoneNumberSectionController,
      durationSectionController:
          durationSectionController ?? this.durationSectionController,
      dateController: dateController ?? this.dateController,
      intervalsSectionController:
          intervalsSectionController ?? this.intervalsSectionController,
      orderModelObj: orderModelObj ?? this.orderModelObj,
    );
  }
}
