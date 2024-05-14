part of 'signup_notifier.dart';

/// Represents the state of Signup in the application.

// ignore_for_file: must_be_immutable
class SignupState extends Equatable {
  SignupState({
    this.companyCtrl,
    this.firstNameCtrl,
    this.lastNameCtrl,
    this.emailCtrl,
    this.passwordCtrl,
    this.phoneCtrl,
    this.signupModelObj,
    this.formKey,
  });

  TextEditingController? firstNameCtrl;
  GlobalKey<FormState>? formKey;

  TextEditingController? lastNameCtrl;

  TextEditingController? companyCtrl;

  TextEditingController? phoneCtrl;

  TextEditingController? emailCtrl;

  TextEditingController? passwordCtrl;

  SignupModel? signupModelObj;

  @override
  List<Object?> get props => [
        firstNameCtrl,
        lastNameCtrl,
        companyCtrl,
        phoneCtrl,
        passwordCtrl,
        emailCtrl,
        signupModelObj,
        formKey
      ];
  SignupState copyWith({
    TextEditingController? firstNameCtrl,
    TextEditingController? lastNameCtrl,
    TextEditingController? companyCtrl,
    TextEditingController? phoneCtrl,
    TextEditingController? passwordCtrl,
    TextEditingController? emailCtrl,
    SignupModel? signupModelObj,
    GlobalKey<FormState>? formKey,
  }) {
    return SignupState(
        firstNameCtrl: firstNameCtrl ?? this.firstNameCtrl,
        lastNameCtrl: lastNameCtrl ?? this.lastNameCtrl,
        companyCtrl: companyCtrl ?? this.companyCtrl,
        phoneCtrl: passwordCtrl ?? this.phoneCtrl,
        passwordCtrl: passwordCtrl ?? this.passwordCtrl,
        emailCtrl: emailCtrl ?? this.emailCtrl,
        signupModelObj: signupModelObj ?? this.signupModelObj,
        formKey: formKey ?? this.formKey);
  }
}
