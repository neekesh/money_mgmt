import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oll2u/core/network/logger.dart';

import '../../../core/app_export.dart';
import '../models/order_model.dart';

part 'order_state.dart';

final orderNotifier = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(
    OrderState(
        emailSectionController: TextEditingController(),
        phoneNumberSectionController: TextEditingController(),
        startDateController: DateTime.now(),
        durationCtrl: TextEditingController(),
        orderModelObj: OrderModel(),
        formKey: GlobalKey<FormState>(),
        addressCtrl: TextEditingController(),
        quantityController: TextEditingController(),
        frequencyCtrl: "weekly"),
  ),
);

/// A notifier that manages the state of a Order according to the event that is dispatched to it.
class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier(OrderState state) : super(state);

  void setInitialValue() {
    state.addressCtrl!.text = PrefUtils().getAddress() ?? "";
    state.emailSectionController!.text = PrefUtils().getEmail() ?? "";
    state.phoneNumberSectionController!.text = PrefUtils().getPhone() ?? "";
    state.frequencyCtrl = "weekly";
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

  validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Address is  required";
    }
    return null;
  }

  validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    return null;
  }

  void setStartDate(DateTime? date) {
    if (date != null) {
      state.startDateController = date;
      debugLog(message: "time ${state.startDateController!}");
      return;
    }
  }

  validateDuration(String? value) {
    if (value == null || value.isEmpty) {
      return "Duration is required";
    }
    if (int.tryParse(value)! < 1) {
      return "Invalid duration";
    }
    if (value.length > 3) {
      return "Invalid duration";
    }
    return null;
  }

  validateStartDate(String? value) {
    if (value == null || value.isEmpty) {
      return "Start date is required";
    }
    return null;
  }

  validateFrequency(String? value) {
    if (value == null || value.isEmpty) {
      return "Frequency is required";
    }
    return null;
  }

  validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return "Quantity is required";
    }
    if (int.tryParse(value)! < 1) {
      return "Invalid quantity";
    }
    if (value.length > 3) {
      return "Invalid quantity";
    }
    return null;
  }

  void setFrequency(String? value) {
    state.frequencyCtrl = value;
  }

  bool isFormValidated() => state.formKey.currentState!.validate();
  Future<void> createOrder(BuildContext context) async {
    if (isFormValidated()) {
      Map<String, dynamic> orderParams = {
        "email": state.emailSectionController!.text,
        "phone_number": state.phoneNumberSectionController!.text,
        "address": state.addressCtrl!.text,
        "start_date": DateFormat('yyyy-MM-dd').format(
          state.startDateController ?? DateTime.now(),
        ),
        "frequency": state.frequencyCtrl,
        "duration": int.tryParse(state.durationCtrl!.text),
        "quantity": int.tryParse(state.quantityController!.text),
      };
      NavigatorService.pushNamed(
        AppRoutes.orderPayment,
        arguments: orderParams,
      );
      // try {
      //   state.isLoading = true;
      //   final request = await dio.post(
      //     APIs.createOrder,
      //     data: orderParams,
      //   );
      //   if (request.statusCode == 200 || request.statusCode == 201) {
      //     state.isLoading = false;
      //     NavigatorService.pushNamed(
      //       AppRoutes.orderPayment,
      //       arguments: {'orderID': request.data["id"]},
      //     );

      //     showSuccess(
      //         "Order Placed Successfully!! Please proceed payment", context);
      //     //  clearForm();
      //   }
      // } on Exception catch (e) {
      //   if (e is DioException) {
      //     showError(
      //         "${e.response?.data ?? "Order creation failed!!"}", context);
      //     return;
      //   }
      //   showError("error occurred:$e", context);
      // }
    }
  }

  void clearForm() {
    state.addressCtrl!.clear();
    state.durationCtrl!.clear();
    state.emailSectionController!.clear();
    state.frequencyCtrl = "";
    state.phoneNumberSectionController!.clear();
    state.quantityController!.clear();
    state.startDateController = null;
  }
}
