part of 'login_notifier.dart';

/// Represents the state of Login in the application.

// ignore_for_file: must_be_immutable
class LoginState extends Equatable {
  LoginState({
    this.usernameCtrl,
    this.passwordCtrl,
    this.loginModelObj,
    required this.formKey,
    this.isLoading = false,
  });

  TextEditingController? usernameCtrl;

  TextEditingController? passwordCtrl;

  LoginModel? loginModelObj;

  GlobalKey<FormState> formKey;

  bool? isLoading;

  @override
  List<Object?> get props =>
      [usernameCtrl, passwordCtrl, loginModelObj, formKey];
  LoginState copyWith({
    TextEditingController? passwordCtrl,
    TextEditingController? usernameCtrl,
    LoginModel? loginModelObj,
    GlobalKey<FormState>? formKey,
    bool? isLoading,
    String? accessToken,
  }) {
    return LoginState(
      passwordCtrl: passwordCtrl ?? this.passwordCtrl,
      usernameCtrl: usernameCtrl ?? this.usernameCtrl,
      loginModelObj: loginModelObj ?? this.loginModelObj,
      formKey: formKey ?? this.formKey,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
