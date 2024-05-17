part of 'invoices_page_one_notifier.dart';

/// Represents the state of InvoicesPageOne in the application.

// ignore_for_file: must_be_immutable
class InvoicesPageOneState extends Equatable {
  InvoicesPageOneState({this.invoicesPageOneModelObj, this.notificationStatus});
  ValueNotifier<Map<String, dynamic>>? notificationStatus;
  InvoicesPageOneModel? invoicesPageOneModelObj;

  @override
  List<Object?> get props => [invoicesPageOneModelObj];
  InvoicesPageOneState copyWith(
      {InvoicesPageOneModel? invoicesPageOneModelObj,
      ValueNotifier<Map<String, dynamic>>? notificationStatus}) {
    return InvoicesPageOneState(
      notificationStatus: notificationStatus ?? this.notificationStatus,
      invoicesPageOneModelObj:
          invoicesPageOneModelObj ?? this.invoicesPageOneModelObj,
    );
  }
}
