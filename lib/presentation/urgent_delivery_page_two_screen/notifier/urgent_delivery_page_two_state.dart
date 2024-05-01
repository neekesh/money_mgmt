part of 'urgent_delivery_page_two_notifier.dart';

/// Represents the state of UrgentDeliveryPageTwo in the application.

// ignore_for_file: must_be_immutable
class UrgentDeliveryPageTwoState extends Equatable {
  UrgentDeliveryPageTwoState({this.urgentDeliveryPageTwoModelObj});

  UrgentDeliveryPageTwoModel? urgentDeliveryPageTwoModelObj;

  @override
  List<Object?> get props => [urgentDeliveryPageTwoModelObj];
  UrgentDeliveryPageTwoState copyWith(
      {UrgentDeliveryPageTwoModel? urgentDeliveryPageTwoModelObj}) {
    return UrgentDeliveryPageTwoState(
      urgentDeliveryPageTwoModelObj:
          urgentDeliveryPageTwoModelObj ?? this.urgentDeliveryPageTwoModelObj,
    );
  }
}
