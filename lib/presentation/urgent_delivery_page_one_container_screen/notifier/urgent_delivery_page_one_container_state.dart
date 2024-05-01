part of 'urgent_delivery_page_one_container_notifier.dart';

/// Represents the state of UrgentDeliveryPageOneContainer in the application.

// ignore_for_file: must_be_immutable
class UrgentDeliveryPageOneContainerState extends Equatable {
  UrgentDeliveryPageOneContainerState(
      {this.urgentDeliveryPageOneContainerModelObj});

  UrgentDeliveryPageOneContainerModel? urgentDeliveryPageOneContainerModelObj;

  @override
  List<Object?> get props => [urgentDeliveryPageOneContainerModelObj];
  UrgentDeliveryPageOneContainerState copyWith(
      {UrgentDeliveryPageOneContainerModel?
          urgentDeliveryPageOneContainerModelObj}) {
    return UrgentDeliveryPageOneContainerState(
      urgentDeliveryPageOneContainerModelObj:
          urgentDeliveryPageOneContainerModelObj ??
              this.urgentDeliveryPageOneContainerModelObj,
    );
  }
}
