part of 'invoices_page_one_notifier.dart';

/// Represents the state of InvoicesPageOne in the application.

// ignore_for_file: must_be_immutable
class InvoicesPageOneState extends Equatable {
  InvoicesPageOneState({this.invoicesPageOneModelObj});

  InvoicesPageOneModel? invoicesPageOneModelObj;

  @override
  List<Object?> get props => [invoicesPageOneModelObj];
  InvoicesPageOneState copyWith(
      {InvoicesPageOneModel? invoicesPageOneModelObj}) {
    return InvoicesPageOneState(
      invoicesPageOneModelObj:
          invoicesPageOneModelObj ?? this.invoicesPageOneModelObj,
    );
  }
}
