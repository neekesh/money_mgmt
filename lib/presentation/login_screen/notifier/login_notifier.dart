import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/login_model.dart';
part 'login_state.dart';

final loginNotifier = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(LoginState(
    edittextController: TextEditingController(),
    edittextoneController: TextEditingController(),
    loginModelObj: LoginModel(),
  )),
);

/// A notifier that manages the state of a Login according to the event that is dispatched to it.
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(LoginState state) : super(state);
}
