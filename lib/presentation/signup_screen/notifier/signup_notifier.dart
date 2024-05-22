import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:oll2u/core/network/apis.dart';
import 'package:oll2u/core/utils/flash_message.dart';
import '../../../core/app_export.dart';
import '../../../core/network/api_s.dart';
import '../models/signup_model.dart';
part 'signup_state.dart';

final signupNotifier = StateNotifierProvider<SignupNotifier, SignupState>(
  (ref) => SignupNotifier(
    SignupState(
      firstNameCtrl: TextEditingController(),
      lastNameCtrl: TextEditingController(),
      emailCtrl: TextEditingController(),
      passwordCtrl: TextEditingController(),
      phoneCtrl: TextEditingController(),
      companyCtrl: TextEditingController(),
      signupModelObj: SignupModel(),
      formKey: GlobalKey<FormState>(),
      addressCtrl: TextEditingController(),
      isLoading: false,
    ),
  ),
);

/// A notifier that manages the state of a Signup according to the event that is dispatched to it.
class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier(SignupState state) : super(state);

  validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    }
    return null;
  }

  validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    }
    return null;
  }

  validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    return null;
  }

  validateCompany(String? value) {
    if (value == null || value.isEmpty) {
      return "Company name is  required";
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

  validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be greater or equal to 6 characters";
    }
    return null;
  }

  bool isFormValidated() => state.formKey!.currentState!.validate();

  ///TODO: signup api integration
  Future<void> onSignup(BuildContext context) async {
    if (isFormValidated()) {
      Map<String, dynamic> user = {
        "first_name": state.firstNameCtrl!.text,
        "last_name": state.lastNameCtrl!.text,
        "phone_number": state.phoneCtrl!.text,
        "company_name": state.companyCtrl!.text,
        "email": state.emailCtrl!.text,
        "password": state.passwordCtrl!.text,
        "address": state.addressCtrl!.text
      };
      try {
        state.isLoading = true;
        final request = await dio.post(APIs.register, data: user);
        if (request.statusCode == 200 || request.statusCode == 201) {
          state.isLoading = false;
          showSuccess("Registration successful!! Please login ", context);
          clearForm();
          NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
        }
      } on Exception catch (e) {
        state.isLoading = false;
        if (e is DioException) {
          if (e.response!.statusCode == 400) {
            showError("${e.response?.data ?? "something went wrong"}", context);
            return;
          }
          showError("${e.response?.data ?? "$e"}", context);
        }
        showError("error occurred:$e", context);
      }
    }
  }

  void clearForm() {
    state.addressCtrl!.clear();
    state.companyCtrl!.clear();
    state.firstNameCtrl!.clear();
    state.lastNameCtrl!.clear();
    state.passwordCtrl!.clear();
    state.phoneCtrl!.clear();
    state.emailCtrl!.clear();
  }
}
