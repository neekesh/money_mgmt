import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:money_mgmt/core/network/logger.dart';
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
    NavigatorService.pushNamed(
      AppRoutes.dashboardPage,
    );

    if (isFormValidated()) {
      Map<String, dynamic> user = {
        "email": state.usernameCtrl!.text,
        "password": state.passwordCtrl!.text
      };

      try {
        state.isLoading = true;
        final request = await dio.post(APIs.login, data: user);
        if (request.statusCode == 200) {
          state.isLoading = false;
          showSuccess("Login successful!!", context);
          debugLog(message: request.data['access']);
          PrefUtils().setAccessToken(request.data['access']);

          NavigatorService.pushNamed(
            AppRoutes.dashboardPage,
          );
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
}
