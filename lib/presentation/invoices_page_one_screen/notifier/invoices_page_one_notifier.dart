import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:money_mgmt/core/network/logger.dart';
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
    notificationStatus:
        ValueNotifier<Map<String, dynamic>>({"id": -1, "status": ""}),
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

  Future<List<dynamic>> getAllNotification(BuildContext context) async {
    List<dynamic> invoiceData = [];
    try {
      final request = await dio.get(
        APIs.getNotification,
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

  Future<void> updateOrderStatus(BuildContext context, int orderID) async {
    debugLog(message: orderID.toString());
    try {
      final request = await dio.put(
        APIs.updateNotification + orderID.toString(),
      );
      debugLog(message: request.statusCode.toString());
      if (request.statusCode == 200 || request.statusCode == 201) {
        showSuccess("Successfully shipped order", context);
        NavigatorService.pushNamed(AppRoutes.notificationScreenSucess);
      }
    } on Exception catch (e) {
      if (e is DioException) {
        showError("${e.response?.data ?? "Shipping failed!!"}", context);
      }
      showError("error occurred:$e", context);
    }
  }

  Future<void> latestNotification(BuildContext context) async {
    try {
      final request = await dio.get(APIs.latestNotification);
      debugLog(message: request.statusCode.toString());
      if (request.statusCode == 200 || request.statusCode == 201) {
        if (PrefUtils().getNotificationID() == null) {
          // tigger listner
          PrefUtils().setNotificationID(request.data["id"]);
          state.notificationStatus!.value = {
            "id": request.data["id"],
            "status": "unseen",
          };
          return;
        }
        if (PrefUtils().getNotificationID() != request.data["id"]) {
          // tigger listner

          state.notificationStatus!.value = {
            "id": request.data["id"],
            "status": "unseen",
          };
          PrefUtils().setNotificationID(request.data["id"]);
          return;
        }
        return;
      }
    } on Exception catch (e) {
      if (e is DioException) {
        showError("${e.response?.data ?? "Notification failed!!"}", context);
      }
      showError("error occurred:$e", context);
    }
  }
}
