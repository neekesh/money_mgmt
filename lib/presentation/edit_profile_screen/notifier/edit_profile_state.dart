part of 'edit_profile_notifier.dart';

/// Represents the state of EditProfile in the application.

// ignore_for_file: must_be_immutable
class EditProfileState extends Equatable {
  EditProfileState(
      {this.edittextController,
      this.edittextoneController,
      this.edittexttwoController,
      this.edittextthreeController,
      this.edittextfourController,
      this.editProfileModelObj});

  TextEditingController? edittextController;

  TextEditingController? edittextoneController;

  TextEditingController? edittexttwoController;

  TextEditingController? edittextthreeController;

  TextEditingController? edittextfourController;

  EditProfileModel? editProfileModelObj;

  @override
  List<Object?> get props => [
        edittextController,
        edittextoneController,
        edittexttwoController,
        edittextthreeController,
        edittextfourController,
        editProfileModelObj
      ];
  EditProfileState copyWith({
    TextEditingController? edittextController,
    TextEditingController? edittextoneController,
    TextEditingController? edittexttwoController,
    TextEditingController? edittextthreeController,
    TextEditingController? edittextfourController,
    EditProfileModel? editProfileModelObj,
  }) {
    return EditProfileState(
      edittextController: edittextController ?? this.edittextController,
      edittextoneController:
          edittextoneController ?? this.edittextoneController,
      edittexttwoController:
          edittexttwoController ?? this.edittexttwoController,
      edittextthreeController:
          edittextthreeController ?? this.edittextthreeController,
      edittextfourController:
          edittextfourController ?? this.edittextfourController,
      editProfileModelObj: editProfileModelObj ?? this.editProfileModelObj,
    );
  }
}
