part of 'urgent_delivery_page_one_page_notifier.dart';

/// Represents the state of UrgentDeliveryPageOne in the application.

// ignore_for_file: must_be_immutable
class UrgentDeliveryPageOneState extends Equatable {
  UrgentDeliveryPageOneState(
      {this.emailController, this.urgentDeliveryPageOneModelObj});

  TextEditingController? emailController;

  UrgentDeliveryPageOneModel? urgentDeliveryPageOneModelObj;

  @override
  List<Object?> get props => [emailController, urgentDeliveryPageOneModelObj];
  UrgentDeliveryPageOneState copyWith({
    TextEditingController? emailController,
    UrgentDeliveryPageOneModel? urgentDeliveryPageOneModelObj,
  }) {
    return UrgentDeliveryPageOneState(
      emailController: emailController ?? this.emailController,
      urgentDeliveryPageOneModelObj:
          urgentDeliveryPageOneModelObj ?? this.urgentDeliveryPageOneModelObj,
    );
  }
}
