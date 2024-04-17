part of 'signup_login_notifier.dart';

/// Represents the state of SignupLogin in the application.

// ignore_for_file: must_be_immutable
class SignupLoginState extends Equatable {
  SignupLoginState({this.signupLoginModelObj});

  SignupLoginModel? signupLoginModelObj;

  @override
  List<Object?> get props => [signupLoginModelObj];
  SignupLoginState copyWith({SignupLoginModel? signupLoginModelObj}) {
    return SignupLoginState(
      signupLoginModelObj: signupLoginModelObj ?? this.signupLoginModelObj,
    );
  }
}
