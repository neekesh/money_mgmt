import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/signup_model.dart';
part 'signup_state.dart';

final signupNotifier = StateNotifierProvider<SignupNotifier, SignupState>(
  (ref) => SignupNotifier(SignupState(
    edittextController: TextEditingController(),
    edittextoneController: TextEditingController(),
    edittexttwoController: TextEditingController(),
    edittextthreeController: TextEditingController(),
    edittextfourController: TextEditingController(),
    signupModelObj: SignupModel(),
  )),
);

/// A notifier that manages the state of a Signup according to the event that is dispatched to it.
class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier(SignupState state) : super(state);
}
