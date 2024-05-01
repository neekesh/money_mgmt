import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../models/profile_details_model.dart';

part 'profile_details_state.dart';

final profileDetailsNotifier =
    StateNotifierProvider<ProfileDetailsNotifier, ProfileDetailsState>(
  (ref) => ProfileDetailsNotifier(ProfileDetailsState(
    profileDetailsModelObj: ProfileDetailsModel(),
  )),
);

/// A notifier that manages the state of a ProfileDetails according to the event that is dispatched to it.
class ProfileDetailsNotifier extends StateNotifier<ProfileDetailsState> {
  ProfileDetailsNotifier(ProfileDetailsState state) : super(state);
}
