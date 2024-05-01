part of 'profile_details_notifier.dart';

/// Represents the state of ProfileDetails in the application.

// ignore_for_file: must_be_immutable
class ProfileDetailsState extends Equatable {
  ProfileDetailsState({this.profileDetailsModelObj});

  ProfileDetailsModel? profileDetailsModelObj;

  @override
  List<Object?> get props => [profileDetailsModelObj];
  ProfileDetailsState copyWith({ProfileDetailsModel? profileDetailsModelObj}) {
    return ProfileDetailsState(
      profileDetailsModelObj:
          profileDetailsModelObj ?? this.profileDetailsModelObj,
    );
  }
}
