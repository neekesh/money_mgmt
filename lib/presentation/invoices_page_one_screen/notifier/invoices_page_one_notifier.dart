import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/invoices_page_one_model.dart';

part 'invoices_page_one_state.dart';

final invoicesPageOneNotifier =
    StateNotifierProvider<InvoicesPageOneNotifier, InvoicesPageOneState>(
  (ref) => InvoicesPageOneNotifier(InvoicesPageOneState(
    invoicesPageOneModelObj: InvoicesPageOneModel(),
  )),
);

/// A notifier that manages the state of a InvoicesPageOne according to the event that is dispatched to it.
class InvoicesPageOneNotifier extends StateNotifier<InvoicesPageOneState> {
  InvoicesPageOneNotifier(InvoicesPageOneState state) : super(state);
}
