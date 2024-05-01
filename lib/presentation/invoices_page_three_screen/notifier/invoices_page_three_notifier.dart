import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/invoices_page_three_model.dart';

part 'invoices_page_three_state.dart';

final invoicesPageThreeNotifier =
    StateNotifierProvider<InvoicesPageThreeNotifier, InvoicesPageThreeState>(
  (ref) => InvoicesPageThreeNotifier(InvoicesPageThreeState(
    invoicesPageThreeModelObj: InvoicesPageThreeModel(),
  )),
);

/// A notifier that manages the state of a InvoicesPageThree according to the event that is dispatched to it.
class InvoicesPageThreeNotifier extends StateNotifier<InvoicesPageThreeState> {
  InvoicesPageThreeNotifier(InvoicesPageThreeState state) : super(state);
}
