import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_s.dart';
import '../../../core/network/apis.dart';
import '../../../core/utils/flash_message.dart';
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

  Future<Map<String, dynamic>> getInvoiceDetails(
      {required int invoiceID, required BuildContext context}) async {
    Map<String, dynamic> invoiceData = {};
    try {
      final request = await dio.get(APIs.invoice + invoiceID.toString());
      if (request.statusCode == 200 || request.statusCode == 201) {
        invoiceData = request.data as Map<String, dynamic>;
      }
    } on Exception catch (e) {
      if (e is DioException) {
        showError("${e.response?.data ?? "Failed to get invoice details!!"}",
            context);
      }
      showError("error occurred:$e", context);
    }
    return invoiceData;
  }
}
