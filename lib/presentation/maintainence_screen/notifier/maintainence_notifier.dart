import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_s.dart';
import '../../../core/network/apis.dart';
import '../../../core/utils/flash_message.dart';
import '../models/maintainence_models.dart';

part 'maintainence_state.dart';

final maintenanceNotifier =
    StateNotifierProvider<MaintenanceNotifier, MaintenanceState>(
  (ref) => MaintenanceNotifier(
    MaintenanceState(
      emailEditTextController: TextEditingController(),
      addressEditTextController: TextEditingController(),
      phoneNumberEditTextController: TextEditingController(),
      messageTextController: TextEditingController(),
      formKey: GlobalKey<FormState>(),
      dateCtrl: DateTime.now(),
      maintenanceModelObj: MaintenanceModel(),
    ),
  ),
);

/// A notifier that manages the state of a Maintenance according to the event that is dispatched to it.
class MaintenanceNotifier extends StateNotifier<MaintenanceState> {
  MaintenanceNotifier(MaintenanceState state) : super(state);

  void setDate(DateTime? date) {
    if (date != null) {
      state.dateCtrl = date;
      return;
    }
  }

  validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    return null;
  }

  validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Address is  required";
    }
    return null;
  }

  validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return "Invalid email address";
    }
    return null;
  }

  bool isFormValidated() => state.formKey.currentState!.validate();
  Future<void> createMaintenance(BuildContext context) async {
    if (isFormValidated()) {
      Map<String, dynamic> maintenanceParams = {
        "email": state.emailEditTextController!.text,
        "phone_number": state.phoneNumberEditTextController!.text,
        "address": state.addressEditTextController!.text,
        "date": DateFormat('yyyy-MM-dd').format(
          state.dateCtrl ?? DateTime.now(),
        ),
        "problem_statment": state.messageTextController?.text ?? "",
      };
      try {
        final request = await dio.post(
          APIs.createMaintenance,
          data: maintenanceParams,
        );
        if (request.statusCode == 200 || request.statusCode == 201) {
          showSuccess("Maintenance date has submitted!!", context);
          clearForm();
          NavigatorService.pushNamed(
            AppRoutes.maintainenceOneScreen,
          );
        }
      } on Exception catch (e) {
        if (e is DioException) {
          showError(
              "${e.response?.data ?? "Maintenance date failed!!"}", context);
          return;
        }
        showError("error occurred:$e", context);
      }
    }
  }

  void clearForm() {
    state.addressEditTextController!.clear();
    state.dateCtrl = DateTime.now();
    state.emailEditTextController!.clear();
    state.phoneNumberEditTextController!.clear();
    state.addressEditTextController!.clear();
    state.messageTextController!.clear();
  }
}
