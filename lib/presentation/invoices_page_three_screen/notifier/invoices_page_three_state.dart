part of 'invoices_page_three_notifier.dart';

/// Represents the state of InvoicesPageThree in the application.

// ignore_for_file: must_be_immutable
class InvoicesPageThreeState extends Equatable {
  InvoicesPageThreeState({this.invoicesPageThreeModelObj});

  InvoicesPageThreeModel? invoicesPageThreeModelObj;

  @override
  List<Object?> get props => [invoicesPageThreeModelObj];
  InvoicesPageThreeState copyWith(
      {InvoicesPageThreeModel? invoicesPageThreeModelObj}) {
    return InvoicesPageThreeState(
      invoicesPageThreeModelObj:
          invoicesPageThreeModelObj ?? this.invoicesPageThreeModelObj,
    );
  }
}
