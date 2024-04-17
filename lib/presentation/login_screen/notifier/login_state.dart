part of 'login_notifier.dart';

/// Represents the state of Login in the application.

// ignore_for_file: must_be_immutable
class LoginState extends Equatable {
  LoginState(
      {this.edittextController,
      this.edittextoneController,
      this.loginModelObj});

  TextEditingController? edittextController;

  TextEditingController? edittextoneController;

  LoginModel? loginModelObj;

  @override
  List<Object?> get props =>
      [edittextController, edittextoneController, loginModelObj];
  LoginState copyWith({
    TextEditingController? edittextController,
    TextEditingController? edittextoneController,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      edittextController: edittextController ?? this.edittextController,
      edittextoneController:
          edittextoneController ?? this.edittextoneController,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
