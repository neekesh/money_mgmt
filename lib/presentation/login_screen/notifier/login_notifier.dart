import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:oll2u/core/network/logger.dart';
import '../../../core/app_export.dart';
import '../../../core/network/api_s.dart';
import '../../../core/network/apis.dart';
import '../../../core/utils/flash_message.dart';
import '../models/login_model.dart';
part 'login_state.dart';

final loginNotifier = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(LoginState(
    usernameCtrl: TextEditingController(),
    passwordCtrl: TextEditingController(),
    loginModelObj: LoginModel(),
    formKey: GlobalKey<FormState>(),
  )),
);

/// A notifier that manages the state of a Login according to the event that is dispatched to it.
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(LoginState state) : super(state);

  validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be greater or equal to 6 characters";
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

  /// signin api integration
  Future<void> onSingIn(BuildContext context) async {
    if (isFormValidated()) {
      print("testet test");
      Map<String, dynamic> user = {
        "email": state.usernameCtrl!.text,
        "password": state.passwordCtrl!.text
      };

      try {
        state.isLoading = true;
        final request = await dio.post(APIs.login, data: user);
        if (request.statusCode == 200) {
          state.isLoading = false;
          PrefUtils().setAccessToken(request.data['access']);
          debugLog(message: request.data['access']);
          await getProfile(context, request.data['access']);
        }
      } on Exception catch (e) {
        if (e is DioException) {
          showError("${e.response?.data ?? "Login Failed!!"}", context);
          return;
        }
        showError("error occurred:$e", context);
      }
    }
  }

  String? authToken() => PrefUtils().getAccessToken();

  Future<void> getProfile(BuildContext context, String token) async {
    Map<String, dynamic> userData = {};
    try {
      final request = await dio.get(APIs.getUser);
      if (request.statusCode == 200 || request.statusCode == 201) {
        userData = request.data as Map<String, dynamic>;
        showSuccess("Login successful!!", context);

        state.passwordCtrl!.clear();
        state.usernameCtrl!.clear();
        PrefUtils().setAddress(userData["address"]);
        PrefUtils().setEmail(userData["email"]);
        PrefUtils().setPhoneNumber(userData["phone_number"]);
        NavigatorService.pushNamedAndRemoveUntil(
          AppRoutes.entryScreen,
        );
      }
    } on Exception catch (e) {
      PrefUtils().clearPreferencesData();
      if (e is DioException) {
        showError("${e.response?.data ?? "Login Failed details!!"}", context);
      }
      showError("error occurred:$e", context);
    }
  }
}
