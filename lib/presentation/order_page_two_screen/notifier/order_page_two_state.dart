part of 'order_page_two_notifier.dart';

/// Represents the state of OrderPageTwo in the application.

// ignore_for_file: must_be_immutable
class OrderPageTwoState extends Equatable {
  OrderPageTwoState({this.orderPageTwoModelObj});

  OrderPageTwoModel? orderPageTwoModelObj;

  @override
  List<Object?> get props => [orderPageTwoModelObj];
  OrderPageTwoState copyWith({OrderPageTwoModel? orderPageTwoModelObj}) {
    return OrderPageTwoState(
      orderPageTwoModelObj: orderPageTwoModelObj ?? this.orderPageTwoModelObj,
    );
  }
}
