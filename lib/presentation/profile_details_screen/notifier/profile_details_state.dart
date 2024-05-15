part of 'profile_details_notifier.dart';

/// Represents the state of ProfileDetails in the application.

// ignore_for_file: must_be_immutable
class ProfileDetailsState extends Equatable {
  ProfileDetailsState({this.profileDetailsModelObj, this.userValues});

  ValueNotifier<Map<String, dynamic>>? userValues;

  ProfileDetailsModel? profileDetailsModelObj;

  @override
  List<Object?> get props => [profileDetailsModelObj];
  ProfileDetailsState copyWith(
      {ProfileDetailsModel? profileDetailsModelObj,
      ValueNotifier<Map<String, dynamic>>? userValues}) {
    return ProfileDetailsState(
      userValues: userValues ?? this.userValues,
      profileDetailsModelObj:
          profileDetailsModelObj ?? this.profileDetailsModelObj,
    );
  }
}
