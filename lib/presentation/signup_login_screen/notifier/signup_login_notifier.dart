import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/signup_login_model.dart';
part 'signup_login_state.dart';

final signupLoginNotifier =
    StateNotifierProvider<SignupLoginNotifier, SignupLoginState>(
  (ref) => SignupLoginNotifier(SignupLoginState(
    signupLoginModelObj: SignupLoginModel(),
  )),
);

/// A notifier that manages the state of a SignupLogin according to the event that is dispatched to it.
class SignupLoginNotifier extends StateNotifier<SignupLoginState> {
  SignupLoginNotifier(SignupLoginState state) : super(state);
}
