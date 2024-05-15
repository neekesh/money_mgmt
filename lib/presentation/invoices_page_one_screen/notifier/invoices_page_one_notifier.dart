import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:money_mgmt/core/utils/flash_message.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_s.dart';
import '../../../core/network/apis.dart';
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

  Future<List<dynamic>> getAllInvoice(BuildContext context) async {
    List<dynamic> invoiceData = [];
    try {
      final request = await dio.get(
        APIs.getAllInvoice,
      );
      if (request.statusCode == 200 || request.statusCode == 201) {
        invoiceData = request.data as List<dynamic>;
      }
    } on Exception catch (e) {
      if (e is DioException) {
        showError("${e.response?.data ?? "Order creation failed!!"}", context);
      }
      showError("error occurred:$e", context);
    }
    return invoiceData;
  }
}
