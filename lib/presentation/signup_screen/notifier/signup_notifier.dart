import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
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
  onSignup() {
    if (isFormValidated()) {
      Map<String, dynamic> user = {
        "firstname": state.firstNameCtrl!.text,
        "lastname": state.lastNameCtrl!.text,
        "phone_number": state.phoneCtrl!.text,
        "company": state.companyCtrl!.text,
        "email": state.emailCtrl!.text,
        "password": state.passwordCtrl!.text
      };

      print("signUp data ${user}");
    }
  }
}
