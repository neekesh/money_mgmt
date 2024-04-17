part of 'signup_notifier.dart';

/// Represents the state of Signup in the application.

// ignore_for_file: must_be_immutable
class SignupState extends Equatable {
  SignupState(
      {this.edittextController,
      this.edittextoneController,
      this.edittexttwoController,
      this.edittextthreeController,
      this.edittextfourController,
      this.signupModelObj});

  TextEditingController? edittextController;

  TextEditingController? edittextoneController;

  TextEditingController? edittexttwoController;

  TextEditingController? edittextthreeController;

  TextEditingController? edittextfourController;

  SignupModel? signupModelObj;

  @override
  List<Object?> get props => [
        edittextController,
        edittextoneController,
        edittexttwoController,
        edittextthreeController,
        edittextfourController,
        signupModelObj
      ];
  SignupState copyWith({
    TextEditingController? edittextController,
    TextEditingController? edittextoneController,
    TextEditingController? edittexttwoController,
    TextEditingController? edittextthreeController,
    TextEditingController? edittextfourController,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      edittextController: edittextController ?? this.edittextController,
      edittextoneController:
          edittextoneController ?? this.edittextoneController,
      edittexttwoController:
          edittexttwoController ?? this.edittexttwoController,
      edittextthreeController:
          edittextthreeController ?? this.edittextthreeController,
      edittextfourController:
          edittextfourController ?? this.edittextfourController,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
